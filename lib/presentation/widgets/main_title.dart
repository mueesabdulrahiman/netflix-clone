import 'package:flutter/material.dart';
import 'package:netfilx/core/constants.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: kTextStyle.copyWith(
        fontSize: 20.0,
      ),
    );
  }
}
