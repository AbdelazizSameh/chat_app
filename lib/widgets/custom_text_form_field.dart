import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.hintText,
    this.labelText,
    super.key,
    this.onChanged,
    this.obsecureText = false,
  });
  final String? hintText;
  final String? labelText;
  final bool? obsecureText;

  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText!,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      style: TextStyle(color: Colors.white),
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.white),
        labelText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        hintText: labelText,
      ),
    );
  }
}
