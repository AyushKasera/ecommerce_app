import 'package:ecommerce_app/models/clothes.dart';
import 'package:ecommerce_app/views/screens/widget/produts.dart';
import 'package:flutter/cupertino.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final clotheList = Clothes.generateClothes();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          height: 280,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProductItem(
                    clothes: clotheList[index],
                  ),
              separatorBuilder: (_, index) => SizedBox(
                    width: 8,
                  ),
              itemCount: clotheList.length),
        )
      ]),
    );
  }
}
