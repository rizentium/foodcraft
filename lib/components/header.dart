import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodcraft/components/locationbar.dart';
import 'package:foodcraft/components/searchbar.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LocationbarWidget(),
        SearchbarWidget(),
      ],
    );
  }
}
