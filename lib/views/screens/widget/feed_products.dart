import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class FeedProducts extends StatefulWidget {
  const FeedProducts({Key? key}) : super(key: key);

  @override
  State<FeedProducts> createState() => _FeedProductsState();
}

class _FeedProductsState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                    image: AssetImage('assets/images/arrival1.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                left: 5,
                top: 15,
                child: Badge(
                  toAnimate: true,
                  shape: BadgeShape.square,
                  badgeColor: Colors.pink,
                  borderRadius: BorderRadius.circular(8),
                  badgeContent:
                      Text('New', style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
          Text(
            'Gucci Oversize',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              height: 1.6,
            ),
          ),
          Text(
            '\$80.99',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              height: 1.6,
            ),
          ),
        ]),
      ),
    );
  }
}
