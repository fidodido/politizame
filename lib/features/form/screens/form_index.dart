import 'package:app_pcp/features/form/screens/form_image.dart';
import '../../../utils/app_constant.dart';
import '../../../utils/app_utils.dart';
import '../../../widgets/primary_button.dart';
import 'package:flutter/material.dart';

class FormIndexScreen extends StatefulWidget {
  const FormIndexScreen({super.key});
  @override
  State<FormIndexScreen> createState() => FormIndexScreenState();
}

class FormIndexScreenState extends State<FormIndexScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.home),
          const SizedBox(
            width: 8,
          ),
          Text(AppConstant.appTitle)
        ]),
      ),
      body: const Padding(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nuevo diseño de campaña',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 42),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Deja que te ayudemos a crear  tu campaña electoral.',
                  style: TextStyle(fontSize: 24),
                ),
              ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButton(
          title: 'Creemos tu campaña',
          onTap: () => {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const FormImageScreen(),
                    transitionDuration: const Duration(milliseconds: 500),
                    transitionsBuilder: AppUtils.defaultTransition,
                  ),
                )
              }),
    );
  }
}
