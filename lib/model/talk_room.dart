import 'package:chat_app/model/user.dart';
import 'package:flutter/cupertino.dart';

class TalkRoom {
  String roomId;
  User talkUser;
  String? lastMessage;

  TalkRoom({
    required this.roomId,
    required this.talkUser,
    this.lastMessage,
});
}