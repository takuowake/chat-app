import 'package:chat_app/model/user.dart';
import 'package:chat_app/pages/talk_room_page.dart';
import 'package:flutter/material.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  List<User> userList = [
    User(name: '田中', uid: 'abc',
        imagePath: 'https://cdn-images-1.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png',
        lastMessage: 'こんにちは'),
    User(name: '佐藤', uid: 'abcd',
        imagePath: 'https://cdn-images-1.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png',
        lastMessage: 'こんばんわ'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('チャットアプリ')),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TalkRoomPage(name: userList[index].name,)));
            },
            child: SizedBox(
              height: 70,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: userList[index].imagePath == null
                        ? null
                        : NetworkImage(userList[index].imagePath!),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(userList[index].name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Text(userList[index].lastMessage, style: TextStyle(color: Colors.grey),),
                    ],
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
