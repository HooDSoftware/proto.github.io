// ignore_for_file: sort_child_properties_last

//import 'package:proton/models/post.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:proton/utils/colors.dart';
import 'package:proton/utils/global_variable.dart';
import 'package:proton/widgets/post_card.dart';
//import 'package:fade_shimmer/fade_shimmer.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
          width > webScreenSize ? webBackgroundColor : mobileBackgroundColor,
      appBar: width > webScreenSize
          ? null
          : AppBar(
              backgroundColor: mobileBackgroundColor,
              centerTitle: false,
              title: Image.asset(
                'images/logo.png',
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.chat_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (ctx, index) => Container(
              margin: EdgeInsets.symmetric(
                horizontal: width > webScreenSize ? width * 0.3 : 0,
                vertical: width > webScreenSize ? 15 : 0,
              ),
              child: PostCard(
                snap: snapshot.data!.docs[index].data(),
              ),
            ),
          );
        },
      ),
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      // crossAxisCount: 2,
      // childAspectRatio: 3/2,
      // crossAxisSpacing: 10,
      // mainAxisSpacing: 10,
      // ),
    );

//                 return GridView.builder(

//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (ctx, index) => Container(
//                     margin: EdgeInsets.symmetric(
//                       horizontal: width > webScreenSize ? width * 0.3 : 0,
//                       vertical: width > webScreenSize ? 15 : 0,
//                     ),
//                     child:PostCard(
//                       snap: snapshot.data!.docs[index].data(),
//                     ),
//                   ),
//                 );
//               },
//             ),
  }
}

// Widget buildItems(Post) => ListView.separated(
  
//   padding:const EdgeInsets.all(8),
//   itemCount: Post
//   separatorBuilder: (BuildContext context,int index)=> const Divider(),,
//   itemBuilder:(BuildContext context,int (context, index) {
//     return ListTile((context, index) => tiltle:Text((context, index) => Post))
//   }} ,
//   )

// Widget buildShimmerItems()=> ListView.separated(
//   padding:const EdgeInsets.all(8.0),
//   itemBuilder: (BuildContext context, int index),
//    separatorBuilder: (BuildContext context ,int index)=>const Divider(),
//    itemCount: 10,
//   {
//     return const Shimmerr();
//   });