import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/view/widgets/text_input_field.dart';
import 'package:tiktok_clone/view/widgets/video_player_iten.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const ConfirmScreen(
    {
      Key? key,
      required this.videoFile,
      required this..videoPath,
    }
  ) : super(key: key);


@override
State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;
  TextEditingController _songController = TextEditingController();
  TextEditingController _captionController = TextEditingController();

  UploadVideoController uploadVideoController = Get.put(uploadVideoController());

 @override
 void initState() {
  super.initState();
  setState(() {
    controller = VideoPlayerController.file(widget.videoFile);
  });

  controller.initialize();
  controller.play();
  controller.setVolume();
  controller.setLooping();
 } 

@override
void dispose(){
  super.dispose();
  controller.dispose();
}

@override
Widget build(BuildContext context){
  return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextInputField(
                    controller: _songController,
                    labelText: 'Song Name',
                    icon: Icons.music_note,
                  ),
                ),
                 const SizedBox(
                  height: 10,
                 ),

                 Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextInputField(
                    controller: _songController,
                    labelText: 'Song Name',
                    icon: Icons.music_note,
                  ),
                 ),
              const SizedBox(
                height: 10,
              ),

              ElevatedButton(
                onPressed: () => uploadVideoController.uploadVideo(
                  _songController.text,
                  _captionController.text,
                  widget.videoPath
                ),
                child: const Text(
                    'Share !',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),
                ))
              ],
            ),
          )
        ],
      ),
    ),
  );
}
}