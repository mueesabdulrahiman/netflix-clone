import 'package:flutter/material.dart';
import 'package:netfilx/presentation/downloads/widgets/section_bottom.dart';
import 'package:netfilx/presentation/downloads/widgets/section_middle.dart';
import 'package:netfilx/presentation/downloads/widgets/section_top.dart';
import 'package:netfilx/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({Key? key}) : super(key: key);

  final downloadsList = const [
    SectionTopWidgets(),
    SectionMiddleWidgets(),
    SectionBottomWidgets()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: AppBarWidget(
            title: 'Downloads',
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: downloadsList[index],
          );
        },
        itemCount: downloadsList.length,
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 20.0),
      ),
    );
  }
}
