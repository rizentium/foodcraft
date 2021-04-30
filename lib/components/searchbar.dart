import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodcraft/components/custom-button.dart';

class SearchbarWidget extends StatelessWidget {
  final double paddingSize;

  const SearchbarWidget({Key? key, this.paddingSize = 8.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(this.paddingSize),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(right: this.paddingSize),
              child: CupertinoSearchTextField(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: Colors.black12,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                placeholder: 'Cari restoran, makanan',
                prefixInsets: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 10.0,
                ),
              ),
            ),
          ),
          CustomButton(
            icon: Icons.person,
            iconColor: Colors.white,
            color: Theme.of(context).primaryColor,
            size: 40.0,
            borderRadius: 50.0,
            onTap: () {},
            elevation: 5.0,
          )
        ],
      ),
    );
  }
}
