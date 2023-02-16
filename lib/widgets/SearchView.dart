import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Container(
      height: 42,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 248,246,250),
          borderRadius: BorderRadius.all(Radius.circular(8))
      ) ,
      child: const TextField(
        expands: false,
        style: TextStyle(color: Colors.grey),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey),
          suffixIcon: Icon(Icons.search),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: "Qidiruv",
        ),
      ),
    );
  }
}
