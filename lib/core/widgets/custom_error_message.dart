import 'package:flutter/material.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage,style: TextStyle(fontSize: 17,fontFamily: 'NotoSerif',fontWeight: FontWeight.w600,color: Colors.red.shade600),));
  }
}