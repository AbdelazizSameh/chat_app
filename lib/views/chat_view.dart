import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/widgets/stream_builder_for_async_messages.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static String id = 'chatView';

  final CollectionReference message = FirebaseFirestore.instance.collection(
    kMessagesCollection,
  );
  final ScrollController scrollController = ScrollController();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(kLogo, width: 60),
            Text('Chat', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: StreamBuilderForAsyncMessages(
        email: email.toString(),
        scrollController: scrollController,
        controller: controller,
        message: message,
      ),
    );
  }
}
