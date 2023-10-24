import 'package:flutter/material.dart';
import 'package:netfilx/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, this.title, this.image}) : super(key: key);
  final String? title;
  final Image? image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        image ?? const SizedBox(),
        Text(
          title ?? '',
          style:
              kTextStyle.copyWith(fontSize: 30.0, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: kWhiteColor,
          size: 30.0,
        ),
        kWidth,
        Container(
          width: 25.0,
          height: 25.0,
          color: Colors.blue,
        ),
        kWidth,
      ],
    );
  }
}
