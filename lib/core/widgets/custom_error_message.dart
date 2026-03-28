import 'package:flutter/material.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Text(errorMessage,style: TextStyle(fontSize: 14,fontFamily: 'NotoSerif',fontWeight: FontWeight.w500,color: Colors.red),);
  }
}