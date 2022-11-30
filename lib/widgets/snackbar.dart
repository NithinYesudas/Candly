import 'package:flutter/material.dart';
class AccessoryWidgets{
  static void snackBar(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message,style: const TextStyle(fontFamily: "Khand"),)));

  }
}
