import 'package:chat_app/model/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class TalkRoomPage extends StatefulWidget {
  final String name;
  const TalkRoomPage({super.key, required this.name});

  @override
  State<TalkRoomPage> createState() => _TalkRoomPageState();
}

class _TalkRoomPageState extends State<TalkRoomPage> {
  List<Message> messageList = [
    Message(message: 'aiu', isMe: true, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiueo', isMe: false, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiueokakikukekosasisusedf;jdjfa;dsjkf;safjdas;asotatitutetonaninunenohahihuheho', isMe: false, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiu', isMe: true, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiueo', isMe: false, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiueokakikukekosasisusedf;jdjfa;dsjkf;safjdas;asotatitutetonaninunenohahihuheho', isMe: false, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiu', isMe: true, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiueo', isMe: false, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiueokakikukekosasisusedf;jdjfa;dsjkf;safjdas;asotatitutetonaninunenohahihuheho', isMe: false, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiu', isMe: true, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiueo', isMe: false, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiueokakikukekosasisusedf;jdjfa;dsjkf;safjdas;asotatitutetonaninunenohahihuheho', isMe: false, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiu', isMe: true, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiueo', isMe: false, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiueokakikukekosasisusedf;jdjfa;dsjkf;safjdas;asotatitutetonaninunenohahihuheho', isMe: false, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiu', isMe: true, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiueo', isMe: false, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiueokakikukekosasisusedf;jdjfa;dsjkf;safjdas;asotatitutetonaninunenohahihuheho', isMe: false, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiu', isMe: true, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiueo', isMe: false, sendTime: DateTime(2023, 1, 1, 12, 00)),
    Message(message: 'aiueokakikukekosasisusedf;jdjfa;dsjkf;safjdas;asotatitutetonaninunenohahihuheho', isMe: false, sendTime: DateTime(2023, 1, 1, 12, 00)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(title: Text(widget.name)),
      body: ListView.builder(
        physics: RangeMaintainingScrollPhysics(),
        shrinkWrap: true,
        reverse: true,
        itemCount: messageList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: index == 0 ? 10 : 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              textDirection: messageList[index].isMe ? TextDirection.rtl : TextDirection.ltr,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: messageList[index].isMe == true
                        ? Colors.green
                        : Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Text(messageList[index].message)
                ),
                Text(intl.DateFormat('HH:mm').format(messageList[index].sendTime))
              ],
            ),
          );
        }
      ),
    );
  }
}
