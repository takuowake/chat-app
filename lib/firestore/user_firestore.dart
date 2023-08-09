import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirestore {
  static final FirebaseFirestore _firebaseFirestoreInstance = FirebaseFirestore.instance;
  static final _userCollection = _firebaseFirestoreInstance.collection('user');

  static Future<void> createUser() async {
    try {
      _userCollection.add({
        'name': 'wake',
        'image_path': 'https://cdn-images-1.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png',
      });
      print('アカウント作成完了');
    } catch (e) {
      print('アカウント作成失敗: $e');
    }
  }
}