import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/app_constant.dart';
import '../../export/screens/export_screen.dart';
import '../../flyer/bloc/flyer_bloc.dart';
import '../../flyer/screens/circle_screen.dart';
import '../../flyer/screens/face_screen.dart';
import '../../flyer/factory/flyer_factory.dart';
import '../../form/bloc/form_bloc.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});
  @override
  State<EditorScreen> createState() => EditorScreenState();
}

class EditorScreenState extends State<EditorScreen> {
  final FlyerBloc faceBloc = FlyerBloc();
  final FlyerBloc circularBloc = FlyerBloc();

  load() async {
    final bloc = BlocProvider.of<FormBloc>(context);

    if (bloc.state.image == null) {
      final byteData = await rootBundle.load(AppConstant.assetAvatar);
      bloc.setImage(byteData.buffer.asUint8List());
    }

    await faceBloc.init(
      type: FlyerType.face,
      style: FaceType.face_1.name,
      primaryColor: bloc.state.primaryColor,
      secundaryColor: bloc.state.secundaryColor,
      terciaryColor: bloc.state.terciaryColor,
      image: bloc.state.image!,
    );
    await circularBloc.init(
      type: FlyerType.circular,
      style: CircularType.circular_1.name,
      primaryColor: bloc.state.primaryColor,
      secundaryColor: bloc.state.secundaryColor,
      terciaryColor: bloc.state.terciaryColor,
      image: bloc.state.image!,
    );
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(Icons.home),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/', (Route<dynamic> route) => false);
            },
          ),
          actions: [
            const SizedBox(
              width: 8,
            ),
            TextButton(
              child: const Text('Nuevo'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const Dialog.fullscreen(
                        child: ExportScreen(),
                      );
                    });
              },
            ),
            TextButton(
              child: const Text('Guardar'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const Dialog.fullscreen(
                        child: ExportScreen(),
                      );
                    });
              },
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: AppConstant.tabFace),
              Tab(text: AppConstant.tabCircular),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FaceScreen(
              bloc: faceBloc,
            ),
            CircleScreen(
              bloc: circularBloc,
            ),
          ],
        ),
      ),
    );
  }
}
