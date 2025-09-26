import 'package:chat_app/models/messages_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constants.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitialState());

  final CollectionReference message = FirebaseFirestore.instance.collection(
    kMessagesCollection,
  );
  List<MessagesModel> messagesList = [];
  void sendMessage({required String userMessage, required String email}) {
    message.add({
      kMessage: userMessage,
      kCreatedAt: DateTime.now(),
      kUserId: email,
    });
  }

  void getMessages() {
    message.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var element in event.docs) {
        messagesList.add(
          MessagesModel.fromJson(element.data() as Map<String, dynamic>),
        );
      }
      emit(ChatSuccessState(messages: messagesList));
    });
  }
}
