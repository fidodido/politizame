import '../../../widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../flyer/bloc/flyer_bloc.dart';
import '../../flyer/bloc/flyer_state.dart';

class FormText extends StatelessWidget {
  final FlyerBloc bloc;
  const FormText({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    return BlocBuilder<FlyerBloc, FlyerState>(
      bloc: bloc,
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  initialValue: state.text1,
                  decoration: const InputDecoration(
                      hintText: '', helperText: "Texto 1"),
                  maxLength: 25,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Ingresa un texto";
                    }
                    return null;
                  },
                  onSaved: (String? newValue) {
                    bloc.setText1(newValue!);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                    initialValue: state.text2,
                    decoration: const InputDecoration(
                        hintText: '', helperText: "Texto 2"),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Ingresa un texto";
                      }
                      return null;
                    },
                    maxLength: 25,
                    onSaved: (String? newValue) {
                      bloc.setText2(newValue!);
                    }),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                    initialValue: state.text3,
                    decoration: const InputDecoration(
                        hintText: '', helperText: "Texto 3"),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Ingresa un texto";
                      }
                      return null;
                    },
                    maxLength: 25,
                    onSaved: (String? newValue) {
                      bloc.setText3(newValue!);
                    }),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                    initialValue: state.text4,
                    decoration: const InputDecoration(
                        hintText: '', helperText: "Texto 4"),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Ingresa un texto";
                      }
                      return null;
                    },
                    maxLength: 25,
                    onSaved: (String? newValue) {
                      bloc.setText4(newValue!);
                    }),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                    initialValue: state.text5,
                    decoration: const InputDecoration(
                      hintText: '',
                      helperText: "Texto 5",
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Ingresa un texto";
                      }
                      return null;
                    },
                    maxLength: 25,
                    onSaved: (String? newValue) {
                      bloc.setText5(newValue!);
                    }),
                const SizedBox(
                  height: 32,
                ),
                ActionButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      Navigator.pop(context);
                    }
                  },
                  title: 'Guardar',
                )
              ]),
        );
      },
    );
  }
}
