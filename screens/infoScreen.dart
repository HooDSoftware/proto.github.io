// ignore_for_file: sort_child_properties_last, file_names

//import 'package:proton/models/post.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:proton/utils/colors.dart';
import 'package:proton/utils/global_variable.dart';
//import 'package:proton/widgets/post_card.dart';
import '/widgets/detailsCard.dart';

import 'package:shimmer_animation/shimmer_animation.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
          width > webScreenSize ? webBackgroundColor : mobileBackgroundColor,
      // appBar: width > webScreenSize
      //     ? null
      //     : AppBar(
      //         backgroundColor: mobileBackgroundColor,
      //         centerTitle: false,
      //         title: Image.asset(
      //           'images/logo.png',
      //         ),
      //         actions: [
      //           IconButton(
      //             icon: const Icon(
      //               Icons.chat_rounded,
      //               color: Colors.white,
      //             ),
      //             onPressed: () {},
      //           ),
      //         ],
      //       ),
      body: Shimmer(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('details').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (ctx, index) => Container(
                margin: EdgeInsets.symmetric(
                  horizontal: width > webScreenSize ? width * 0.3 : 0,
                  vertical: width > webScreenSize ? 15 : 0,
                ),
                child: DetailsCard(
                  snap: snapshot.data!.docs[index].data(),
                ),
              ),
            );
          },
        ),

        duration: const Duration(seconds: 3),
        // This is NOT the default value. Default value: Duration(seconds: 0)
        interval: const Duration(seconds: 3),
        // This is the default value
        color: Colors.grey,
        // This is the default value
        colorOpacity: 0.3,
        // This is the default value
        enabled: true,
        // This is the default value
        direction: const ShimmerDirection.fromLTRB(),
      ),
    );
  }
}
