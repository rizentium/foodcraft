import 'package:flutter/material.dart';
import 'package:foodcraft/components/custom-button.dart';

class LocationbarWidget extends StatelessWidget {
  final double paddingSize;

  const LocationbarWidget({Key? key, this.paddingSize = 8.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(this.paddingSize),
      child: Row(
        children: [
          CustomButton(
            icon: Icons.room,
            iconColor: Colors.white,
            color: Theme.of(context).primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lokasi Anda',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Jl. Perintis Kemerdekaan No. 11 A',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
