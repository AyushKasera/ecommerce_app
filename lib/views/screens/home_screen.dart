import 'package:ecommerce_app/views/screens/widget/customApp_bar.dart';
import 'package:ecommerce_app/views/screens/widget/search_input.dart';
import 'package:ecommerce_app/views/screens/widget/tagList.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CustomAppBar(),
        SearchInput(),
        TagList(),
      ],
    ));
  }
}
