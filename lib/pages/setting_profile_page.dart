import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SettingProfilePage extends StatefulWidget {
  const SettingProfilePage({super.key});

  @override
  State<SettingProfilePage> createState() => _SettingProfilePageState();
}

class _SettingProfilePageState extends State<SettingProfilePage> {
  File? image;
  final ImagePicker _picker = ImagePicker();

  Future<void> selectImage() async {
    XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if(pickedImage == null) return;
    setState(() {
      image = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('プロフィール編集'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 150, child: Text('名前')),
                Expanded(child: TextField()),
              ],
            ),
            SizedBox(height: 50,),
            Row(
              children: [
                SizedBox(width: 150, child: Text('プロフィール画像')),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        selectImage();
                      },
                      child: Text('画像を選択'),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
            image == null
                ? SizedBox()
                : SizedBox(
              width: 200,
                height: 200,
                child: Image.file(image!, fit: BoxFit.cover)
            ),
            SizedBox(height: 150,),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                },
                child: Text('編集'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
