import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';

class CommentScreen extends StatelessWidget {
  final String id;

  CommentScreen({Key? key, required this.id}) : super(key: key);

  final TextEditingController _commentController = TextEditingController();
  CommentController commentController = Get.put(commentController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostId(id);

    return Scaffold(
      body : SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Obx((){
                    return ListView.builder(
                      itemCount: commentController.comments.length,
                      itemBuilder: ((context, index){
                          final comment = commentController.comments[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: NetworkImage(comment.profilePhoto),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  "${comment.username}  ",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                                Text(
                                  comment.comment,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                  ),
                                )
                              ],
                            ),
                           
                            subtitle: Row(
                              children: [
                                Text(
                                  tago.format(
                                    comment.datePublished.toDate(),
                                  ),
                                  style: const TssextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                              ],
                            ),

                            trailing: InkWell(
                              onTap: () => commentController.likeComment(comment.id),
                              child: Icon(
                                Icons.favorite,
                                size: 25,
                                color: comment.likes
                                  .contains(authController.user.uid)
                                  ? Colors.red : Colors.white
                              ),
                            ),
                          );
                      });
                }),
              ),
              const Divider(),
              ListTile(
                title: TextFormField(
                  controller: _commentController,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),

                ),
              )

            ],
          ),
        ),
      )
    )
  }
}
