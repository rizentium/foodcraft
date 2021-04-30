import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdsCarouselWidget extends StatelessWidget {
  final List<String> items = [
    "lib/assets/images/promo1.webp",
    "lib/assets/images/promo2.webp",
    "lib/assets/images/promo3.webp",
    "lib/assets/images/promo4.webp",
    "lib/assets/images/promo5.webp"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return carouselItem(source: this.items[index]);
        },
      ),
    );
  }

  Widget carouselItem({required String source}) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.asset(
        source,
        fit: BoxFit.fill,
        width: 250.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );
  }
}
