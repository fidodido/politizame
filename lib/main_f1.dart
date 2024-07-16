import 'package:app_pcp/features/flyer/widgets/face/face_3.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'features/flyer/bloc/flyer_bloc.dart';
import 'features/flyer/factory/flyer_factory.dart';
import 'utils/app_constant.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstant.appTitle,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const LoadFlyer(),
    );
  }
}

class LoadFlyer extends StatefulWidget {
  const LoadFlyer({super.key});

  @override
  State<LoadFlyer> createState() => _LoadFlyerState();
}

class _LoadFlyerState extends State<LoadFlyer> {
  bool loaded = false;
  final FlyerBloc faceBloc = FlyerBloc();

  void load() async {
    final byteData = await rootBundle.load(AppConstant.assetAvatar);

    await faceBloc.init(
      type: FlyerType.face,
      style: FaceType.face_1.name,
      primaryColor: Colors.white,
      secundaryColor: Colors.black,
      terciaryColor: Colors.red,
      image: byteData.buffer.asUint8List(),
    );

    await faceBloc.setText1('Evelyn');
    await faceBloc.setText2('Alcaldesa');
    await faceBloc.setText3('aa70');
    await faceBloc.setText4('Providencia');
    await faceBloc.setText5('Va a estar mejor');
    await faceBloc.setText6('70');

    setState(() {
      loaded = true;
    });
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('test')),
      body: loaded
          ? Center(
              child: SizedBox(
                  width: 250, height: 500, child: Face3(state: faceBloc.state)),
            )
          : const CircularProgressIndicator(),
    );
  }
}
