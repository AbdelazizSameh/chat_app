import 'package:chat_app/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

void onSubmitted({
  required TextEditingController controller,
  required ScrollController scrollController,
  required String email
}) {
  CollectionReference message = FirebaseFirestore.instance.collection(
    kMessagesCollection,
  );

  final userMessage = controller.text.trim();
  if (userMessage.isEmpty) return;

  message.add({kMessage: userMessage, kCreatedAt: DateTime.now(),kUserId:email});

  controller.clear();
  scrollController.animateTo(
    0,
    duration: Duration(milliseconds: 1500),
    curve: Curves.easeInOut,
  );
}
