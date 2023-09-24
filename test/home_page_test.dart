import 'package:calc_simple/app/data/repositories/imc_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calc_simple/presentation/pages/home_page.dart';

void main() {
  testWidgets('Test HomePage UI', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));

    // Verify that the title 'Calcule seu IMC' is displayed.
    expect(find.text('Calcule seu IMC'), findsOneWidget);

    // Verify that the text fields and the 'Calcular meu IMC' button are displayed.
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Calcular meu IMC'), findsOneWidget);
  });

  test('Test IMC Calculation', () {
    final imcRepository = IMCRepository();

    final imc1 = imcRepository.calculateIMC(weight: 70, height: 1.7);
    final imc2 = imcRepository.calculateIMC(weight: 80, height: 1.75);

    expect(imc1.text, 'Sobrepeso');
    expect(imc2.text, 'Obesidade Grau I');
  });
}
