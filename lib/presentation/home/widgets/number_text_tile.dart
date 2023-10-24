import 'package:flutter/material.dart';
import 'package:netfilx/core/constants.dart';
import 'package:netfilx/presentation/home/widgets/number_card.dart';
import 'package:netfilx/presentation/widgets/main_title.dart';

class NumberTextTile extends StatelessWidget {
  const NumberTextTile({
    Key? key,
    required this.title,
    required this.imageList,
  }) : super(key: key);

  final String title;
  final List<String?> imageList;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kHeight,
        LimitedBox(
          maxHeight: screenSize.width * 0.55,
          child: ListView(
            //shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: NumberCard(
                  index: index,
                  width: screenSize.width * 0.35,
                  
                  // height: screenSize.width * 0.45,
                  imageUrl: imageList[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
