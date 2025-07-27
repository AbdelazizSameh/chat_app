import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/models/messages_model.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_bubble_for_a_friend.dart';
import 'package:chat_app/widgets/text_input_field_for_chat_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamBuilderForAsyncMessages extends StatelessWidget {
  const StreamBuilderForAsyncMessages({
    super.key,
    required this.scrollController,
    required this.controller,
    required this.message,
    required this.email,
  });
  final CollectionReference message;

  final ScrollController scrollController;
  final TextEditingController controller;
  final String email;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: message.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessagesModel> messagesList = [];
          for (var document in snapshot.data!.docs) {
            messagesList.add(
              MessagesModel.fromJson(document.data() as Map<String, dynamic>),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  controller: scrollController,
                  padding: EdgeInsets.all(10),
                  // physics: BouncingScrollPhysics(),
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) =>
                      messagesList[index].id == email
                      ? ChatBubble(i: index, message: messagesList[index])
                      : ChatBubbleForAFriend(
                          i: index,
                          message: messagesList[index],
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextInputFieldForChatPage(
                  controller: controller,
                  scrollController: scrollController,
                  email: email,
                ),
              ),
              // ),
            ],
          );
        } else {
          return Center(child: Text('Loading'));
        }
      },
    );
  }
}
