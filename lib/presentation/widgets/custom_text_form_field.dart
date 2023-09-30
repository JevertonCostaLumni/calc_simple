// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? suffixIcon;
  final String? labelText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  const CustomTextFormField({
    Key? key,
    required this.suffixIcon,
    required this.labelText,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 200,
        child: TextFormField(
          focusNode: focusNode,
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
