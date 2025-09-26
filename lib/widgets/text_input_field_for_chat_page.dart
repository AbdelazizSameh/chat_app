import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      onSubmitted: (_) => _sendMessage(context),
      decoration: InputDecoration(
        hintText: 'Send Message',
        suffixIcon: IconButton(
          onPressed: () => _sendMessage(context),

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

  void _sendMessage(BuildContext context) {
    final userMessage = controller.text.trim();
    if (userMessage.isEmpty) return;

    BlocProvider.of<ChatCubit>(
      context,
    ).sendMessage(userMessage: userMessage, email: email);

    controller.clear();

    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }

    FocusScope.of(context).unfocus();
  }
}
