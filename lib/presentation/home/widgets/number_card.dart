import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netfilx/core/constants.dart';
import 'package:netfilx/core/strings.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({Key? key, this.width, this.height, required this.index, required this.imageUrl})
      : super(key: key);
  final double? height;
  final double? width;
  final int index;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              height: height,
              width: width! * 0.3,
            ),
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                image:  DecorationImage(
                  image: NetworkImage(imageUrl == null ?
                      'https://www.prokerala.com/movies/assets/img/no-poster-available.jpg' : '$kImageAppendUrl$imageUrl'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ],
        ),
        Positioned(
          top: 90,
          left: index == 0 ? 12 : -10,
          child: BorderedText(
              strokeWidth: 4.0,
              strokeColor: kWhiteColor,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: kBlackColor,
                  fontSize: 110.0,
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.none,
                  decorationColor: kBlackColor,
                ),
              )),
        ),
      ],
    );
  }
}
