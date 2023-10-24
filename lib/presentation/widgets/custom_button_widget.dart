import 'package:flutter/material.dart';
import 'package:netfilx/core/constants.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.icon,
    required this.label,
    this.size = 25.0,
    this.labelSize = 15.0,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final double size;
  final labelSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('button clicked');
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhiteColor,
            size: size,
          ),
          Text(
            label,
            style: TextStyle(fontSize: labelSize),
          ),
        ],
      ),
    );
  }
}
