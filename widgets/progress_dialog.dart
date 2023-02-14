// ignore_for_file: must_be_immutable

import'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget
{
  String? message;
  ProgressDialog({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black12,
      child: Container(
        margin:const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color:Colors.black12,
          borderRadius: BorderRadius.circular(6),
        ),

            child:Padding(
          padding: const EdgeInsets.all(15.0),
      child:Row(
        children: [
          const SizedBox(width:6.0,),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),

          ),
          const SizedBox(width:6.0,),
          Text(
            message!,
            style:const TextStyle(
              color:Colors.white54,
              fontSize: 12,
            ),
          ),
        ]

      ),
      ),

      ),
    );
  }
}
