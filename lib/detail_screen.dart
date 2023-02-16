import 'package:flutter/material.dart';
import 'package:maxway_flutter/product_page.dart';

import 'Model.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title.uz),
        elevation: 4,
      ),
      backgroundColor: Colors.blueGrey.shade50,
      body: Column(
        children: [
          Container(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.all(24),
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Image.network(url + widget.product.image)),
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 16, left: 24),
              child: Text(
                widget.product.title.uz,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              )),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                widget.product.description.uz,
                style: const TextStyle(fontSize: 16),
              )),
        ],
      ),
    );
  }
}
