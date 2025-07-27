import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/helpers/helpers.dart';
import 'package:flutter/material.dart';

class TextInputFieldForChatPage extends StatelessWidget {
  const TextInputFieldForChatPage({
    super.key,
    required this.controller,
    required this.scrollController,
    required this.email,
  });
  final ScrollController scrollController;
  final TextEditingController controller;
  final String email;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (_) => onSubmitted(
        controller: controller,
        scrollController: scrollController,
        email: email,
      ),
      decoration: InputDecoration(
        hintText: 'Send Message',
        suffixIcon: IconButton(
          onPressed: () => onSubmitted(
            controller: controller,
            scrollController: scrollController,
            email: email,
          ),
          icon: Icon(Icons.send),
          color: kPrimaryColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.indigoAccent),
        ),
      ),
    );
  }
}
