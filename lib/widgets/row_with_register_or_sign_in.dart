import 'package:flutter/material.dart';

class RowWithRegisterOrSignIn extends StatelessWidget {
  const RowWithRegisterOrSignIn({
    super.key,
    required this.textPartoOne,
    required this.textPartTwo,
    required this.onTap,
  });
  final String textPartoOne;
  final String textPartTwo;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(textPartoOne, style: TextStyle(color: Colors.grey)),
        InkWell(
          borderRadius: BorderRadius.circular(13),
          onTap: onTap,
          child: Text(
            textPartTwo,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
