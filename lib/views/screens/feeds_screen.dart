import 'package:ecommerce_app/views/screens/widget/feed_products.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Feed Products',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          childAspectRatio: 240 / 330,
          children: List.generate(
            50,
            (index) => FeedProducts(),
          )),
    );
  }
}
