import 'package:flutter/material.dart';
import 'package:netfilx/core/constants.dart';

class SectionTopWidgets extends StatelessWidget {
  const SectionTopWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text(
          'Smart Downloads',
          style: kTextStyle,
        ),
      ],
    );
  }
}
