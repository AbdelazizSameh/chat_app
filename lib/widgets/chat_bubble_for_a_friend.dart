import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/models/messages_model.dart';
import 'package:flutter/material.dart';

class ChatBubbleForAFriend extends StatelessWidget {
  const ChatBubbleForAFriend({
    super.key,
    required this.i,
    required this.message,
  });

  final int i;
  final MessagesModel message;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 10, right: 40),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        constraints: BoxConstraints(maxWidth: 170, minWidth: 0),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
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
