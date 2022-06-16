import 'package:flutter/material.dart';

class TagList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tagList = [
      'Woman',
      'T-shirt',
      'Dress',
    ];
    return Row(
      children: tagList
          .map((e) => Container(
                margin: EdgeInsets.all(14),
                padding: EdgeInsets.all(10),
                child: Text(
                  e,
                  style: TextStyle(color: Colors.grey),
                ),
              ))
          .toList(),
    );
  }
}
