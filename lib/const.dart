import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/views/screens/cart_screen.dart';
import 'package:ecommerce_app/views/screens/feeds_screen.dart';
import 'package:ecommerce_app/views/screens/home_screen.dart';
import 'package:ecommerce_app/views/screens/profile_screen.dart';
import 'package:ecommerce_app/views/screens/search_screen.dart';
import 'package:ecommerce_app/views/screens/upload_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

//pages

List pages = [
  HomeScreen(),
  FeedScreen(),
  SearchScreen(),
  CartScreen(),
  UploadScreen(),
  ProfileScreen(),
];

var backgroundColor = Colors.black;

var mybutttonColor = Colors.black;
var textButtonColor = Colors.white;

//Firebase
var firebaseAuth = FirebaseAuth.instance;

var fiebaseStore = FirebaseFirestore.instance;

var firebaseStorage = FirebaseStorage.instance;
