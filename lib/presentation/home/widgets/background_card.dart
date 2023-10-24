import 'package:flutter/material.dart';
import 'package:netfilx/core/constants.dart';
import 'package:netfilx/core/strings.dart';
import 'package:netfilx/presentation/widgets/custom_button_widget.dart';
import 'package:netfilx/presentation/main_page/screen_main_page.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: screenSize.height * 0.75,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage('$kImageAppendUrl$imageUrl'),
            fit: BoxFit.cover,
          )),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButtonWidget(
                icon: Icons.add,
                label: 'My List',
              ),
              _playButton(),
              const CustomButtonWidget(
                icon: Icons.info_outline,
                label: 'Info',
              ),
            ],
          ),
        ),
      ],
    );
  }

  ElevatedButton _playButton() {
    return ElevatedButton.icon(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kWhiteColor)),
        icon: const Icon(
          Icons.play_arrow,
          size: 35.0,
          color: kBlackColor,
        ),
        label: Text(
          'Play',
          style: kTextStyle.copyWith(color: kBlackColor),
        ));
  }
}
