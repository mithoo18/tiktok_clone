import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/view/screens/~/profile_screen.dart';

class SeachScreen extends StatelessWidget{
  SearchScreen({Key? key}) : super(key: key)
 
  final SearchController searchController = Get.put(searchController();)

  @override
  Widget build(BuildContext context){
    return obx((){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: TextFormField(
            decoration: const InputDecorator(
              decoration: const InputDecoration(
                filled: false,
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onFieldSubmitted : (value) => searchController.searchUser(value,
              ),
              ),
              body : searchController.searchedUser.isEmpty
                ? const Center(
                  child: Text(
                    'Search for users!',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
                 : ListView.builder(
                  itemBuilder: ((context, index) {
                    User user = searchController.searchedUsers[index];
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => ProfileScreen(uid: user.uid),
                          ),
                      ),
                      child : ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            user.profilePhoto,),
                        ),
                        title: Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }) 
                  )
          ),
        ),
      )
    })
  }

}