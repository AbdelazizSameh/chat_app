import 'package:chat_app/models/messages_model.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.i, required this.message});

  final int i;
  final MessagesModel message;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        constraints: BoxConstraints(maxWidth: 170, minWidth: 0),
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }
}
