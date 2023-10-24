import 'package:flutter/material.dart';
import 'package:netfilx/core/constants.dart';
import 'package:netfilx/presentation/main_page/screen_main_page.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: screenSize.height * 0.25,
          child: Image.network(
            url,
            loadingBuilder:
                (BuildContext _, Widget child, ImageChunkEvent? progress) {
              if (progress == null) {
                return child;
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                );
              }
            },
            errorBuilder: (BuildContext _, Object a, StackTrace? trace) {
              return const Center(
                child: Icon(Icons.network_wifi, color: kWhiteColor,),
                );
              
            },
            fit: BoxFit.cover,
          ),
        ),
        const Positioned(
          right: 5,
          bottom: 5,
          child: CircleAvatar(
            backgroundColor: kBlackColor,
            radius: 20.0,
            child: Icon(
              Icons.volume_off,
              color: kWhiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
