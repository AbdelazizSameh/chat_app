import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomSignAndRegisterButton extends StatelessWidget {
  const CustomSignAndRegisterButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        fixedSize: Size(double.maxFinite, 45),
      ),
      child: Text(text, style: TextStyle(fontSize: 20, color: kPrimaryColor)),
    );
  }
}
