import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proton/screens/add_post_screen.dart';
import 'package:proton/screens/feed_screen.dart';
import 'package:proton/screens/profile_screen.dart';
import 'package:proton/screens/search_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const SearchScreen(),
  const FeedScreen(),
  const AddPostScreen(),
  const Text('notifications'),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
