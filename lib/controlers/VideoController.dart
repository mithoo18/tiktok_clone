import 'dart:html';

import 'package:tiktok_clone/constants.dart';

class VideoController extends GetxController {
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);
  List<Video> get videoList = _videoList.value;

  @override
  void onInit(){
    super.onInit();
    _videoList.bindStream(
      firestore.collection('videos').snapshots().map((QuerySnapshot query){
        List<Video> retVAl =[];
        for(var element in query.docs){
          retVal.add(
            Video.fromSnap(element),
          );
        }
      }));
  }

  likeVideo(String id) async{
    DocumentSnapshot doc = await firestore.collection('videos').doc(id).get();
    var uid = authController.user.uid;
    if((doc.data()! as dynamic)['likes'].contain(uid)){
      await firestore.collection('videos').doc(id).update(
        {
          'likes' : FieldValue.arrayRemove([uid]),
        });
    } else {
      await firestore.collection('videos').doc(id).update({
        'likes' : FieldValue.arrayUnion([uid]),
      });
    }
  
  }


}
