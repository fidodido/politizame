import 'package:flutter/material.dart';
import '../../common/widgets/primary_button.dart';
import 'form_image.dart';
import '../../../config/app_constant.dart';
import '../../../config/app_utils.dart';

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
                  'New campaign design',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 42),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Let us help you create your electoral campaign.',
                  style: TextStyle(fontSize: 24),
                ),
              ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButton(
          title: "Let's go for it",
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
