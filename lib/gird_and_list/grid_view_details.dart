import 'package:flutter/material.dart';
import 'package:shagouf_project/gird_and_list/item.dart';

class GridViewDetails extends StatelessWidget {
  final Item item;
  const GridViewDetails(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(item.title),
      ),
      body: Hero(
        tag: item.id,
        child: Image.network(item.image),
      ),
    );
  }
}
