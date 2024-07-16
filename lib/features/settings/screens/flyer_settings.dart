
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/app_utils.dart';
import '../../../widgets/primary_icon_button.dart';
import '../../flyer/bloc/flyer_bloc.dart';
import '../../flyer/bloc/flyer_state.dart';
import '../widgets/form_text.dart';

enum ColorOptions { colorPrimary, colorSecundary, colorTerciary }

class FlyerSettings extends StatefulWidget {
  final FlyerBloc bloc;
  const FlyerSettings({super.key, required this.bloc});
  @override
  State<FlyerSettings> createState() => FlyerSettingsState();
}

class FlyerSettingsState extends State<FlyerSettings> {
  Future<Uint8List> changeBackground() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image == null || !mounted) {
      throw 'er';
    }

    CroppedFile? croppedFile = await AppUtils.cropImage(context, image);

    if (croppedFile == null) {
      throw 'er';
    }
    return await croppedFile.readAsBytes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlyerBloc, FlyerState>(
      bloc: widget.bloc,
      builder: (context, state) {
        return SizedBox(
            height: 50,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(32, 4, 32, 4),
              scrollDirection: Axis.horizontal,
              children: [
                PrimaryIconButton(
                  onTap: () {
                    widget.bloc.setStyle();
                  },
                  icon: const Icon(Icons.style),
                ),
                const SizedBox(
                  width: 16,
                ),
                PrimaryIconButton(
                  onTap: () {
                    widget.bloc.setPalette();
                  },
                  icon: const Icon(Icons.palette),
                ),
                const SizedBox(
                  width: 16,
                ),
                PrimaryIconButton(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: true,
                            title: const Text('Modificar textos'),
                            content: FormText(
                              bloc: widget.bloc,
                            ),
                          );
                        });
                  },
                  icon: const Icon(Icons.abc),
                ),
                const SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                  child: const Text('Imagen de fondo'),
                  onPressed: () async {
                    Uint8List image = await changeBackground();
                    widget.bloc.setImage(image);
                  },
                ),
                const SizedBox(
                  width: 32,
                ),
                ElevatedButton(
                  child: const Text('Logo'),
                  onPressed: () async {
                    Uint8List logo = await changeBackground();
                    widget.bloc.setLogo(logo);
                  },
                ),
                const SizedBox(
                  width: 32,
                ),
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Color picker'),
                              content: SingleChildScrollView(
                                child: MaterialPicker(
                                  pickerColor: state.primaryColor,
                                  onColorChanged: (Color color) {
                                    widget.bloc.setPrimaryColor(color);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                        width: 50, height: 50, color: state.primaryColor)),
                const SizedBox(
                  width: 32,
                ),
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Color picker'),
                              content: SingleChildScrollView(
                                child: MaterialPicker(
                                  pickerColor: state.secundaryColor,
                                  onColorChanged: (Color color) {
                                    widget.bloc.setSecundaryColor(color);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                        width: 50, height: 50, color: state.secundaryColor)),
                const SizedBox(
                  width: 32,
                ),
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Color picker'),
                              content: SingleChildScrollView(
                                child: MaterialPicker(
                                  pickerColor: state.terciaryColor,
                                  onColorChanged: (Color color) {
                                    widget.bloc.setTerciaryColor(color);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                        width: 50, height: 50, color: state.terciaryColor)),
                const SizedBox(
                  width: 32,
                ),
              ],
            ));
      },
    );
  }
}
