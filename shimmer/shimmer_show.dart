// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Shimmerr extends StatefulWidget {
//   const Shimmerr({super.key});

//   @override
//   State<Shimmerr> createState() => _ShimmerrState();
// }

// class _ShimmerrState extends State<Shimmerr> {
//   List dataList = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("shimmer"),
//         ),
//         body: FutureBuilder(
//             future: FirestoreDataBase().getData(),
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return const Text("something went wrong");
//               }
//               if (snapshot.connectionState.done) {
//                 dataList = snapshot.data as List;
//                 return buildItems(dataList);
//               }
//               return const Center(child: CircularProgressIndicator());
//             }));
//   }
// }
