import 'package:flutter/material.dart';
class AccessoryWidgets{
  static void snackBar(BuildContext context, String message,
      {Color bgColor = Colors.black87}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: bgColor,content: Text(message,style: const TextStyle(fontFamily: "Khand"),)));

  }
}
