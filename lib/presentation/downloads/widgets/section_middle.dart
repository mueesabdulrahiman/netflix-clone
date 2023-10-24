import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/application/downloads/downloads_bloc.dart';
import 'package:netfilx/core/constants.dart';
import 'package:netfilx/core/strings.dart';
import 'package:netfilx/presentation/main_page/screen_main_page.dart';

class SectionMiddleWidgets extends StatelessWidget {
  const SectionMiddleWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
          BlocProvider.of<DownloadsBloc>(context)
              .add(const DownloadsEvent.getDownloadsImage());
        });

    return Column(
      children: [
        Text(
          'Introducing Downloads For You',
          style: kTextStyle.copyWith(fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
        kHeight,
        Text(
          'We will download a personalised selection of\n movies and shows for you, so there is\n  always something to watch on your\n device ',
          style: kTextStyle.copyWith(
            color: Colors.grey,
            fontSize: 13.0,
          ),
          textAlign: TextAlign.center,
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: screenSize.width,
              height: screenSize.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: screenSize.width * 0.38,
                          backgroundColor: kGreyColor,
                        ),
                        DownloadsImageWidget(
                          angle: 18,
                          imageUrl:
                              '$kImageAppendUrl${state.downloads[2].posterPath}',
                          padding: const EdgeInsets.only(left: 150.0, top: 15.0),
                          size: Size(
                              screenSize.width * 0.35, screenSize.width * 0.5),
                        ),
                        DownloadsImageWidget(
                            angle: -18,
                            imageUrl:
                                '$kImageAppendUrl${state.downloads[1].posterPath}',
                            padding:
                                const EdgeInsets.only(right: 150.0, top: 15.0),
                            size: Size(screenSize.width * 0.35,
                                screenSize.width * 0.5)),
                        DownloadsImageWidget(
                            imageUrl:
                                '$kImageAppendUrl${state.downloads[0].posterPath}',
                            padding: const EdgeInsets.only(top: 7.0),
                            size: Size(screenSize.width * 0.38,
                                screenSize.width * 0.58)),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageUrl,
    this.angle = 0,
    required this.padding,
    required this.size,
  }) : super(key: key);

  final String imageUrl;
  final double angle;
  final EdgeInsets padding;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          //margin: margin,
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
                // image: NetworkImage(imageUrl ==null?'https://www.prokerala.com/movies/assets/img/no-poster-available.jpg': imageUrl ), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
