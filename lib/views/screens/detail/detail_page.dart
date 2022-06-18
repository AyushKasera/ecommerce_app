import 'package:ecommerce_app/models/clothes.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  //const DetailPage({Key? key}) : super(key: key);
  final Clothes clothes;
  DetailPage(this.clothes);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    clothes.imageUrl.toString(),
                  ),
                  fit: BoxFit.fitHeight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Positioned(
              left: 15,
              top: 35,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                clothes.productName.toString(),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 15,
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
