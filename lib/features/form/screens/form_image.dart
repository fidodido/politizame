import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/app_constant.dart';
import '../../../utils/app_utils.dart';
import '../../../widgets/primary_button.dart';
import '../bloc/form_bloc.dart';
import '../bloc/form_bloc_state.dart';

class FormImageScreen extends StatefulWidget {
  const FormImageScreen({super.key});
  @override
  State<FormImageScreen> createState() => FormImageScreenState();
}

class FormImageScreenState extends State<FormImageScreen> {
  @override
  void initState() {
    BlocProvider.of<FormBloc>(context).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Icon(Icons.home),
          const SizedBox(
            width: 8,
          ),
          Text(AppConstant.appTitle)
        ]),
      ),
      body: BlocBuilder<FormBloc, FormBlocState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<FormBloc>(context);
          if (state.status == FormBlocStatus.loaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Selecciona una imagen',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      const Text(
                        'Puedes saltar este paso si no estas seguro',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Image.memory(
                        state.image!,
                        width: 250,
                        height: 250,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      ActionButton(
                          onTap: () async {
                            final ImagePicker picker = ImagePicker();
                            final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery,
                            );

                            if (image == null || !mounted) {
                              return;
                            }

                            CroppedFile? croppedFile =
                                await AppUtils.cropImage(context, image);

                            if (croppedFile == null) {
                              return;
                            }

                            final bytes = await croppedFile.readAsBytes();
                            bloc.setImage(bytes);
                          },
                          title: 'Subir imagen')
                    ]),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: ActionButton(
        title: 'Siguiente',
        onTap: () {
          Navigator.pushNamed(context, '/editor');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
