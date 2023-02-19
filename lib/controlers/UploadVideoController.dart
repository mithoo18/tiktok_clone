import 'package:tiktok_clone/constants.dart';

class UploadVideoController extends GetxController {
  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.MediumQuality,
    );

    Future<String> _uploadVideoToString(String id, String videoPath) async {
      Reference ref = firebaseStorage.ref().child('videos').child(id);

      UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
      TaskSnapshot snap = await uploadTask;
      String downloadUrl = await snap.ref.getDownloadURL();
      return downloadUrl;
    }

    _getThumbnail(String videoPath) async {
      final thumbanil = await VideoCompress.getFileThumbnail(videoPath);
      return thumbanil;
    }

    Future<String> _uploadImageToStorage(String id, String videoPath) async {
      Reference ref = firebaseStorage.ref().child('thumbnails').child(id);
      UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
      TaskSnapshot snap = await uploadTask;
      String downloadUrl = await uploadTask;
      return downloadUrl;
    }

    uploadVideo(String songName, String caption, String VideoPath) async {
      try {
        String uid = firebaseAuth.currentUser!.uid;
        DocumentSnapshot userDoc =
            await firestore.collection('users').doc(uid).get();
        var allDocs = await firestore.collection('videos').get();
        int len = allDocs.docs.length;
        String videoUrl = await _uploadVideoToStorage("Video $len" videoPath);
        String thumbnail = await _uploadImageToStorage("Video $len",videoPath);

        Video video = Video(
          username : (userDoc.data())! as Map<String,dynamic>['name'],
          uid : uid,
          id : "Video $len",
          likes : [],
          commentCount : 0,
          shareCount : 0,
          songName : songName,
          caption : caption,
          videoUrl : videoUrl,
          profilePhoto : (userDoc.data()! as Map<String,dynamic>)['profilePhoto'],
          thumbnail : thumbnail 
          );

          await firestore.collection('videos').doc('Video $len').set(
            video.toJson(),
          );
      Get.back();
    } catch (e) {
      Get.snackbar(
        'Error Uploading Video',
        e.toString(),
      );
    }
  }
}
}