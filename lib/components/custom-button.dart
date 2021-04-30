import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String imagePath;
  final IconData? icon;
  final Color iconColor;
  final double iconSize;
  final Color color;
  final double elevation;
  final double size;
  final double borderRadius;
  final void Function()? onTap;

  const CustomButton(
      {Key? key,
      this.imagePath = '',
      this.icon,
      this.color = Colors.white,
      this.iconSize = 0,
      this.iconColor = Colors.black,
      this.elevation = 0.0,
      this.size = 30.0,
      this.borderRadius = 7.5,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: this.color,
      borderRadius: BorderRadius.circular(this.borderRadius),
      elevation: this.elevation,
      child: InkWell(
        borderRadius: BorderRadius.circular(this.borderRadius),
        child: Container(
          height: this.size,
          width: this.size,
          alignment: Alignment.center,
          child: this.imagePath != ''
              ? Image.asset(
                  this.imagePath,
                  color: this.iconColor,
                  width: this.iconSize > 0 ? this.iconSize : this.size * 0.75,
                )
              : Icon(
                  this.icon,
                  size: this.iconSize > 0 ? this.iconSize : this.size * 0.75,
                  color: this.iconColor,
                ),
        ),
        onTap: this.onTap,
      ),
    );
  }
}
