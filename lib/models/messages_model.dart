import 'package:chat_app/constants/constants.dart';

class MessagesModel {
  final String message;
  final String id;
  MessagesModel(this.message, this.id);

  factory MessagesModel.fromJson(Map<String, dynamic> jsonData) {
    return MessagesModel(jsonData[kMessage], jsonData[kUserId]);
  }
}
