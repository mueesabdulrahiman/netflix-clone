import 'package:flutter/material.dart';
import 'package:netfilx/core/constants.dart';

class SectionBottomWidgets extends StatelessWidget {
  const SectionBottomWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {},
              color: Colors.blue,
              child: Text(
                'Set Up',
                style: kTextStyle.copyWith(color: kWhiteColor),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            color: kWhiteColor,
            child: Text(
              'See What you can download',
              style: kTextStyle.copyWith(color: kBlackColor),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ],
      ),
    );
  }
}
