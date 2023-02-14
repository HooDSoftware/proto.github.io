import 'package:cloud_firestore/cloud_firestore.dart';

class CarDetails {
  final String make;
  final String uid;
  final String username;
  final dynamic clap;
  final String postId;
  final DateTime datePublished;
  final String postUrl;
  final String profImage;
  final String color;
  final String type;
  final String numberPlate;

  const CarDetails({
    required this.make,
    required this.uid,
    required this.username,
    required this.clap,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.color,
    required this.type,
    required this.numberPlate,
  });

  static CarDetails fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return CarDetails(
        make: snapshot["carMake"],
        uid: snapshot["uid"],
        clap: snapshot["clap"],
        postId: snapshot["postId"],
        datePublished: snapshot["datePublished"],
        username: snapshot["username"],
        postUrl: snapshot['postUrl'],
        profImage: snapshot['profImage'],
        color: snapshot['color'],
        type: snapshot['type'],
        numberPlate: snapshot['numberPlate']);
  }

  Map<String, dynamic> toJson() => {
        "carMake": make,
        "uid": uid,
        "clap": clap,
        "username": username,
        "postId": postId,
        "datePublished": datePublished,
        'postUrl': postUrl,
        'profImage': profImage,
        'numberPlate':numberPlate,
        'type':type,
        'color':color,
        
        



       

      };
}
