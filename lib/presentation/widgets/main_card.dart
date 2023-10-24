import 'package:flutter/material.dart';
import 'package:netfilx/core/strings.dart';

class MainCard extends StatelessWidget {
  const MainCard({Key? key, this.width, this.height, this.imageUrl})
      : super(key: key);
  final double? height;
  final double? width;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl ==
                  null
              ? 'https://www.prokerala.com/movies/assets/img/no-poster-available.jpg'
              : '$kImageAppendUrl$imageUrl'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
