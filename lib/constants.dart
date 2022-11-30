
import 'package:flutter/material.dart';


ListPages = [
  VideoScreen(),
  SeacrchScreen(),
  const AddVideoScreen(),
  Text('Message Screen'),
  ProfileScreen(uid : authController.user.uid),
];


const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;


