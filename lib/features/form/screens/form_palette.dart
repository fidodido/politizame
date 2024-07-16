import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/palette.dart';
import '../../../utils/app_constant.dart';
import '../../../utils/app_utils.dart';
import '../../../widgets/primary_button.dart';
import '../bloc/form_bloc.dart';
import '../bloc/form_bloc_state.dart';
import 'form_image.dart';

class FormPaletteScreen extends StatefulWidget {
  const FormPaletteScreen({super.key});
  @override
  State<FormPaletteScreen> createState() => FormPaletteScreenState();
}

class FormPaletteScreenState extends State<FormPaletteScreen> {
  List<Palette> palettes;
  Palette? selectedPalette;

  FormPaletteScreenState() : palettes = AppConstant.paletteList;

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
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Icon(Icons.home),
          const SizedBox(
            width: 8,
          ),
          Text(AppConstant.appTitle)
        ]),
      ),
      body: BlocBuilder<FormBloc, FormBlocState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<FormBloc>(context);
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 64),
            child: Column(children: [
              const Text(
                'Selecciona una paleta que coincida con tu marca',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                'Puedes saltar este paso si no estas seguro',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 32,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: palettes.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15),
                    itemBuilder: (BuildContext context, int index) {
                      Palette palette = AppConstant.paletteList[index];

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            for (var palette in palettes) {
                              palette.selected = false;
                            }

                            bloc.setPalette(palettes[index]);
                            palettes[index].selected = true;
                            selectedPalette = palettes[index];

                            bloc.setPrimaryColor(Color(int.parse(
                                '0xFF${selectedPalette!.colors[0]}')));
                            bloc.setSecundaryColor(Color(int.parse(
                                '0xFF${selectedPalette!.colors[1]}')));
                            bloc.setTerciaryColor(Color(int.parse(
                                '0xFF${selectedPalette!.colors[2]}')));
                          });
                        },
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Card(
                              shape: palette.selected
                                  ? RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Colors.blueAccent, width: 5.0),
                                      borderRadius: BorderRadius.circular(4.0))
                                  : null,
                              elevation: 12,
                              child: SizedBox(
                                width: 60,
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    for (var color in palette.colors)
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          color: Color(int.parse('0xFF$color')),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 4, 6, 4),
                                  color: Colors.black45,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      palettes[index].title,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      );
                    }),
              ),
            ]),
          );
        },
      ),
      floatingActionButton: ActionButton(
        title: 'Siguiente',
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const FormImageScreen(),
              transitionDuration: const Duration(milliseconds: 500),
              transitionsBuilder: AppUtils.defaultTransition,
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
