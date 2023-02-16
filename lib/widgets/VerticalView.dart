import 'package:flutter/material.dart';

class VerticalView extends StatelessWidget {
  final double height;
  final double widht;
  const VerticalView({Key? key, required this.height, required this.widht}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final names = List.from(["Barchasi","Tog","Adir", "Qir","Daryo","Tog","Adir", "Qir","Daryo"]);
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: SizedBox(
            height: height,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  margin: const EdgeInsets.only(right: 8),
                  child: Stack(
                    children: [
                      Image.network("https://images.unsplash.com/photo-1613479267503-eafa8b242987?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bmF0dXJhbCUyMGJlYXV0eXxlbnwwfHwwfHw%3D&w=1000&q=80"),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        margin: const EdgeInsets.only(left: 4),
                        alignment: Alignment.center,
                        child: const Text("Zomin \n Jizzax", style:
                        TextStyle(color: Colors.white,
                            fontSize: 12),),
                      )
                    ],
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
