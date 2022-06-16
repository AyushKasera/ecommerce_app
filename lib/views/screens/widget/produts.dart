import 'package:flutter/material.dart';

import '../../../models/clothes.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.clothes}) : super(key: key);
  final Clothes clothes;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(children: [
         // crossAxisAlignment: CrossAxisAlignment.center,
          Stack(
            children: [
              Container(
                height: 170,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      clothes.imageUrl.toString(),
                    ),
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
