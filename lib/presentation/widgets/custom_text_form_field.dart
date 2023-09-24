import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? suffixIcon;
  final String? labelText;
  final TextEditingController? controller;
  const CustomTextFormField({
    super.key,
    required this.suffixIcon,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 200,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            labelText: labelText,
            suffixIcon: suffixIcon,
          ),
          keyboardType: TextInputType.phone,
        ),
      ),
    );
  }
}
