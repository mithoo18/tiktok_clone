import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({Key? key}) : super(key: key) 

  final VideoController videoController = Get.put(VideoController());

  buildProfile(String profilePhoto){
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(children: [
        Positioned(
          left: 5,
          child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(image: NetworkImage(profilePhoto),
              fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],),
    );
  }

  buildMusicAlbum(String profilePhoto){
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        children: [
            Container(
              padding: EdgeInsets.all(11),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: 
                [
                  Colors.grey,
                  Colors.white
                ])
              ),
            )
        ],
      ),
    );
  }

@override
Widget build(BuildContext context){
  final size = MediaQuery.of(context).size;
  return Scaffold(
    body: Obx((){

      
    }),
  )
}

}