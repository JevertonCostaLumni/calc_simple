import 'package:calc_simple/app/data/repositories/imc_repository.dart';
import 'package:calc_simple/app/entities/hive_data.dart';
import 'package:calc_simple/presentation/widgets/custom_modal_bs.dart';
import 'package:calc_simple/presentation/widgets/custom_rinch_text.dart';
import 'package:calc_simple/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

late Box<Dados> box;

FocusNode heightFocusNode = FocusNode();
FocusNode weightFocusNode = FocusNode();

TextEditingController weightController = TextEditingController(text: '');
TextEditingController heightController = TextEditingController(text: '');

RichText imcResult = RichText(
  text: const TextSpan(
    text: '',
    style: TextStyle(fontSize: 25),
  ),
);

Future<void> openBox() async {
  box = await Hive.openBox<Dados>('dados');
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    openBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Center(
          child: Text('Calcule seu IMC', style: TextStyle(color: Colors.white)),
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Seu IMC é:',
                style: TextStyle(color: Colors.deepPurple),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: imcResult,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextFormField(
                focusNode: heightFocusNode,
                key: const Key('heightTextField'),
                labelText: 'Digite sua altura (cm)',
                suffixIcon: const Icon(
                  Icons.person_pin_rounded,
                  color: Colors.deepPurple,
                ),
                controller: heightController,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextFormField(
                focusNode: weightFocusNode,
                key: const Key('weightTextField'),
                labelText: 'Digite seu peso',
                suffixIcon: const Icon(
                  Icons.school_rounded,
                  color: Colors.deepPurple,
                ),
                controller: weightController,
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () async {
                  double heightInMeters = double.parse(heightController.text) / 100;

                  ColoredText result = IMCRepository().calculateIMC(
                    height: heightInMeters,
                    weight: double.parse(weightController.text),
                  );
                  Dados dados = Dados(
                    double.parse(weightController.text),
                    heightInMeters,
                    result.text,
                  );

                  await box.add(dados);

                  setState(() {
                    imcResult = RichText(
                      text: TextSpan(
                        text: result.text,
                        style: TextStyle(
                          fontSize: 25,
                          color: result.color,
                        ),
                      ),
                    );
                  });

                  heightFocusNode.unfocus();
                  weightFocusNode.unfocus();
                },
                child: Card(
                  color: Colors.deepPurple,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 250),
                    alignment: Alignment.center,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Calcular meu IMC',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  List<Dados> listaDeDados = [];

                  listaDeDados = box.values.cast<Dados>().toList();

                  setState(() {});

                  showModalBottomSheet(
                    context: context,
                    builder: (context) => ModalBsCustom(listaDeDados: listaDeDados),
                  );
                },
                child: Card(
                  color: Colors.deepPurple.withOpacity(.5),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 250),
                    alignment: Alignment.center,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Conferir meu Historico',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
