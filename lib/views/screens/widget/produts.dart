import 'package:ecommerce_app/views/screens/detail/detail_page.dart';
import 'package:flutter/material.dart';

import '../../../models/clothes.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.clothes}) : super(key: key);
  final Clothes clothes;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => DetailPage(clothes))));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 15,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
            Text(
              clothes.productName.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 1.6,
              ),
            ),
            Text(
              clothes.price.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 1.6,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
