import 'package:device_preview/device_preview.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/editor/screens/editor_screen.dart';
import 'features/form/bloc/form_bloc.dart';
import 'features/form/screens/form_index.dart';
import 'utils/app_constant.dart';

void main() => runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FormBloc>(create: (context) => FormBloc()),
      ],
      child: MaterialApp(
        title: AppConstant.appTitle,
        scrollBehavior: MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.dark,
        routes: {
          '/': (context) => const FormIndexScreen(),
          '/editor': (_) => const EditorScreen()
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
