import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gal/gal.dart';

import '../../flyer/bloc/flyer_bloc.dart';

class ExportScreen extends StatefulWidget {
  const ExportScreen({super.key});
  @override
  State<ExportScreen> createState() => ExportScreenState();
}

class ExportScreenState extends State<ExportScreen> {
  void downloadImage() async {
    final bloc = BlocProvider.of<FlyerBloc>(context);
    bloc.state.controller.capture().then((Uint8List? image) {
      saveImageToGallery(image!);
    }).catchError((onError) {});
  }

  void saveImageToGallery(Uint8List image) async {
    await Gal.putImageBytes(image);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Exportar tu campaña'),
        const SizedBox(height: 32),
        ElevatedButton(
            child: const Text('Descargar Paloma'),
            onPressed: () {
              downloadImage();
            })
      ],
    );
  }
}
