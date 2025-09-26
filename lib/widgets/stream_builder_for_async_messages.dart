import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/models/messages_model.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_bubble_for_a_friend.dart';
import 'package:chat_app/widgets/text_input_field_for_chat_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              var messagesList = BlocProvider.of<ChatCubit>(
                context,
              ).messagesList;
              return ListView.builder(
                reverse: true,
                controller: scrollController,
                padding: EdgeInsets.all(10),
                itemCount: messagesList.length,
                itemBuilder: (context, index) => messagesList[index].id == email
                    ? ChatBubble(i: index, message: messagesList[index])
                    : ChatBubbleForAFriend(
                        i: index,
                        message: messagesList[index],
                      ),
              );
            },
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
      ],
    );
  }
}
