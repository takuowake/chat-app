import 'package:chat_app/firestore/room_firestore.dart';
import 'package:chat_app/model/message.dart';
import 'package:chat_app/model/talk_room.dart';
import 'package:chat_app/utils/shared_prefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class TalkRoomPage extends StatefulWidget {
  final TalkRoom talkRoom;
  const TalkRoomPage(this.talkRoom, {Key? key}) : super(key: key);

  @override
  State<TalkRoomPage> createState() => _TalkRoomPageState();
}

class _TalkRoomPageState extends State<TalkRoomPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(title: Text(widget.talkRoom.talkUser.name)),
      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: RoomFirestore.fetchMessageSnapshot(widget.talkRoom.roomId),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 60.0),
                  child: ListView.builder(
                      physics: RangeMaintainingScrollPhysics(),
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final doc = snapshot.data!.docs[index];
                        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                        final Message message = Message(
                            message: data['message'],
                            isMe: SharedPrefs.fetchUid() == data['sender_id'],
                            sendTime: data['send_time'],
                        );
                        return Padding(
                          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: index == 0 ? 10 : 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            textDirection: message.isMe ? TextDirection.rtl : TextDirection.ltr,
                            children: [
                              Container(
                                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: message.isMe == true
                                        ? Colors.green
                                        : Colors.white,
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                  child: Text(message.message)
                              ),
                              Text(intl.DateFormat('HH:mm').format(message.sendTime.toDate()))
                            ],
                          ),
                        );
                      }
                  ),
                );
              } else {
                return const Center(child: Text('メッセージがありません'),);
              }
            }
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.white,
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            border: OutlineInputBorder()
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).padding.bottom,
              ),
            ],
          )
        ],
      ),
    );
  }
}
