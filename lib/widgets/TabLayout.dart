import 'package:flutter/material.dart';
import 'package:maxway_flutter/Model.dart';

class TabLayout extends StatelessWidget {
  final double height;
  final double widht;
  final List<Category> list;
  const TabLayout({Key? key, required this.height, required this.widht, required this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: SizedBox(
            height: height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return  SizedBox(
                  width: widht,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 4),
                   decoration: const BoxDecoration(
                     color: Color.fromARGB(255, 94, 223, 255),
                     borderRadius: BorderRadius.all(Radius.circular(12))
                   ),
                    child: Text(list[index].title.uz),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
