import 'package:flutter/material.dart';
import 'package:netfilx/presentation/downloads/screen_downloads.dart';
import 'package:netfilx/presentation/fast_and_laughs/screen_fast_and_laughs.dart';
import 'package:netfilx/presentation/home/screen_home.dart';
import 'package:netfilx/presentation/main_page/widgets/nav_bar.dart';
import 'package:netfilx/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netfilx/presentation/search/screen_search.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
final screenSize = MediaQuery.of(scaffoldKey.currentContext!).size;

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final _pages = [
    ScreenHome(),
    const ScreenNewAndHot(),
   const  ScreenFastAndLaughs(),
    ScreenSearch(),
    const ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: NavigationBarWidget.navbarCurrentIndex,
          builder: (context, int newIndex, _) {
            return _pages[newIndex];
          },
        ),
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
