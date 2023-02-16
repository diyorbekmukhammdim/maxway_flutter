import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
   const Button({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 24),
      height: 50,
      width: 260,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child:  Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
