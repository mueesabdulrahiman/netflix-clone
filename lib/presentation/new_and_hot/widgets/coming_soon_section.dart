import 'package:flutter/material.dart';
import 'package:netfilx/core/constants.dart';
import 'package:netfilx/presentation/main_page/screen_main_page.dart';
import 'package:netfilx/presentation/new_and_hot/widgets/video_widget.dart';
import 'package:netfilx/presentation/widgets/custom_button_widget.dart';

class ComingSoonSection extends StatelessWidget {
  const ComingSoonSection({
    Key? key,
    required this.id,
    required this.day,
    required this.dayInWords,
    required this.month,
    required this.movieName,
    required this.posterPath,
    required this.description,
  }) : super(key: key);
  final String id;
  final String day;
  final String dayInWords;
  final String month;
  final String movieName;
  final String posterPath;
  final String description;
  

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const  EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              SizedBox(
                width: screenSize.width * 0.15,
                height: screenSize.height * 0.55,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      month,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      day,
                      style:
                          kTextStyle.copyWith(fontSize: 25.0, letterSpacing: 5.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: screenSize.width * 0.85,
          height: screenSize.height * 0.55,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                url: posterPath,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      //maxLines: 2,
                      style: kTextStyle.copyWith(
                        overflow: TextOverflow.ellipsis,
                          fontSize: 30.0,
                          letterSpacing: -2,
                          wordSpacing: 2,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  //const Spacer(),
                  const CustomButtonWidget(
                    icon: Icons.notifications_none,
                    label: 'Remind Me',
                    labelSize: 10.0,
                  ),
                  kWidth,
                  const CustomButtonWidget(
                    icon: Icons.info_outline,
                    label: 'Info',
                    labelSize: 10.0,
                  ),
                  kWidth,
                ],
              ),
               Text(
                'Coming on $dayInWords',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              kHeight,
              Text(
                movieName,
                style: kTextStyle.copyWith(fontSize: 20.0),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 15.0,
                  top: 5.0,
                ),
                child: Text(
                  description,
                  maxLines: 4,
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
//'https://qrius.com/wp-content/uploads/2014/03/Highway-Movie-Poster.jpg'