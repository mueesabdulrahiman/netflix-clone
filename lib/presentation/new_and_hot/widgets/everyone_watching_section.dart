import 'package:flutter/material.dart';
import 'package:netfilx/core/constants.dart';
import 'package:netfilx/presentation/new_and_hot/widgets/video_widget.dart';
import 'package:netfilx/presentation/widgets/custom_button_widget.dart';

class EveryoneWatchingSection extends StatelessWidget {
  final String movieName;
  final String posterPath;
  final String description;
  const EveryoneWatchingSection({
    Key? key,
    required this.movieName,
    required this.posterPath,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
          Text(
            movieName,
            style: kTextStyle.copyWith(fontSize: 20.0),
          ),
          kHeight,
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Text(
              description,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey.shade500),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          VideoWidget(url: posterPath),
          kHeightLarge,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              CustomButtonWidget(
                icon: Icons.share,
                label: 'Share',
                labelSize: 10.0,
                size: 30.0,
              ),
              kWidth,
              CustomButtonWidget(
                icon: Icons.add,
                label: 'My List',
                labelSize: 10.0,
                size: 30.0,
              ),
              kWidth,
              CustomButtonWidget(
                icon: Icons.play_arrow,
                label: 'Play',
                labelSize: 10.0,
                size: 30.0,
              ),
              kWidth,
            ],
          ),
        ],
      ),
    );
  }
}
