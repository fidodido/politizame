import 'package:app_pcp/application/domain/service/sign_in_service.dart';
import 'package:app_pcp/features/login/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../persistence/login_adapter.dart';
import '../../../persistence/shared_pref_storage.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
          sessionStorage: SharedPrefStorage(),
          userRepository: LoginAdapter(),
          signInService: SignInService()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign in'),
        ),
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            // redirect to home.
            if (state.status == LoginStatus.loaded) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/', (Route<dynamic> route) => false);
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Your username (*):',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'You must enter a username.';
                        }
                        if (value.length > 15) {
                          return 'You username is too long.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        username = value!;
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const Text(
                      'Ingresa tu password:',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'You must enter a password.';
                        }
                        if (value.length > 15) {
                          return 'You username is too long.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        password = value!;
                      },
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          debugPrint('form is valid ...');
                          BlocProvider.of<LoginBloc>(context)
                              .login(username, password);
                        }
                      },
                      child: const Text('Sign in'),
                    )
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
