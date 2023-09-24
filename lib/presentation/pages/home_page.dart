import 'package:calc_simple/app/data/repositories/imc_repository.dart';
import 'package:calc_simple/presentation/widgets/custom_rinch_text.dart';
import 'package:calc_simple/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController weightController = TextEditingController(text: '');
TextEditingController heightController = TextEditingController(text: '');

RichText imcResult = RichText(
  text: const TextSpan(
    text: '',
    style: TextStyle(fontSize: 25),
  ),
);

class _HomePageState extends State<HomePage> {
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
                onTap: () {
                  double heightInMeters = double.parse(heightController.text) / 100;

                  ColoredText result = IMCRepository().calculateIMC(
                    height: heightInMeters,
                    weight: double.parse(weightController.text),
                  );
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
