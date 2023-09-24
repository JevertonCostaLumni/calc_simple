import 'package:calc_simple/presentation/widgets/custom_rinch_text.dart';
import 'package:flutter/material.dart';

class IMCRepository {
  ColoredText calculateIMC({
    required double weight,
    required double height,
  }) {
    if (weight <= 0 || height <= 0) {
      return const ColoredText(
        text: "Valores inválidos",
        color: Colors.red,
      );
    }

    double imc = weight / (height * height);

    if (imc < 16) {
      return const ColoredText(
        text: "Muito abaixo do peso",
        color: Colors.blue,
      );
    } else if (imc >= 16 && imc < 16.9) {
      return const ColoredText(
        text: "Abaixo do peso",
        color: Colors.green,
      );
    } else if (imc >= 17 && imc < 18.4) {
      return const ColoredText(
        text: "Peso normal",
        color: Colors.orange,
      );
    } else if (imc >= 18.5 && imc < 24.9) {
      return const ColoredText(
        text: "Sobrepeso",
        color: Colors.yellow,
      );
    } else if (imc >= 25 && imc < 29.9) {
      return const ColoredText(
        text: "Obesidade Grau I",
        color: Colors.amber,
      );
    } else if (imc >= 30 && imc < 34.9) {
      return const ColoredText(
        text: "Obesidade Grau II",
        color: Colors.purple,
      );
    } else if (imc >= 35 && imc < 39.9) {
      return const ColoredText(
        text: "Obesidade Grau III (Obesidade Mórbida)",
        color: Colors.red,
      );
    } else {
      return const ColoredText(
        text: "Obesidade Grau IV (Obesidade Extrema)",
        color: Colors.redAccent,
      );
    }
  }
}
