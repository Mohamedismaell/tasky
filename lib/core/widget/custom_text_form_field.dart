import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hinttext,
    required this.onChanged,
    this.errorMessage,
    this.maxLines,
    this.initialValue,
  });

  final String? initialValue;
  final int? maxLines;
  final String hinttext;
  final String? errorMessage;
  void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(hintText: hinttext, errorText: errorMessage),
      onChanged: onChanged,
    );
  }
}
