import 'package:app_pcp/features/export/bloc/export_bloc.dart';
import 'package:app_pcp/features/export/bloc/export_state.dart';
import 'package:app_pcp/features/login/screens/login_screen.dart';
import 'package:app_pcp/persistence/login_adapter.dart';
import 'package:app_pcp/persistence/shared_pref_storage.dart';
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
  @override
  void initState() {
    super.initState();
  }

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
    return BlocProvider(
      create: (context) => ExportBloc(
          sessionStorage: SharedPrefStorage(), userRepository: LoginAdapter())
        ..init(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Export your campaign'),
        ),
        body: BlocConsumer<ExportBloc, ExportState>(
          listener: (context, state) {
            // redirect to Login Screen.
            if (state.status == ExportStatus.error) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Clic to export in PNG format.'),
                    const SizedBox(height: 32),
                    ElevatedButton(
                        child: const Text('Download'),
                        onPressed: () {
                          downloadImage();
                        })
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
