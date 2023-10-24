
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/application/home/home_bloc.dart';
import 'package:netfilx/core/constants.dart';
import 'package:netfilx/presentation/home/widgets/background_card.dart';
import 'package:netfilx/presentation/home/widgets/listview_tile.dart';
import 'package:netfilx/presentation/home/widgets/number_text_tile.dart';
import 'package:netfilx/presentation/main_page/screen_main_page.dart';
import 'package:netfilx/presentation/widgets/app_bar_widget.dart';

class ScreenHome extends StatelessWidget {  
  ScreenHome({Key? key}) : super(key: key);

  ValueNotifier<bool> notifyDirection = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context)
          .add(const HomeEvent.getDataInHomePage());
    });
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: notifyDirection,
          builder: (ctx, updatedBool, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  notifyDirection.value = false;
                } else if (direction == ScrollDirection.forward) {
                  notifyDirection.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.isLoading == true) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state.isError) {
                        return const Center(
                            child: Text('Error while loading data'));
                      } else if (state.pastYearMovieData.isEmpty) {
                        return const Center(
                          child: Text('Data is empty'),
                        );
                      }
                      final pastYearMovieImageList = state.pastYearMovieData
                          .map((e) => e.posterPath)
                          .toList();
                      final trendingMovieImageList = state.trendingNowMovieData
                          .map((e) => e.posterPath)
                          .toList();
                      final tenseMovieImageList = state.tenseDramasMovieData
                          .map((e) => e.posterPath)
                          .toList();
                      final southIndianMovieImageList = state
                          .southIndianMovieData
                          .map((e) => e.posterPath)
                          .toList();
                      final topTvList =
                          state.topTvData.map((e) => e.posterPath).toList();
                         // log(trendingMovieImageList.first!);
                      return ListView(
                        // shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 10.0),

                        children: [
                          BackgroundCard(
                            imageUrl: trendingMovieImageList.first!,

                          ),
                          ListviewTile(
                            title: 'Released in the Past Year',
                            imageList: pastYearMovieImageList.sublist(0, 10),
                          ),
                          kHeightLarge,
                          ListviewTile(
                            title: 'Trending Now',
                            imageList: trendingMovieImageList.sublist(3, 13),
                          ),
                          kHeightLarge,
                          NumberTextTile(
                            title: 'Top 10 TV Shows in India Today',
                            imageList: topTvList,
                          ),
                          kHeightLarge,
                          ListviewTile(
                            title: 'Tense Dramas',
                            imageList: tenseMovieImageList.sublist(5, 15),
                          ),
                          kHeightLarge,
                          ListviewTile(
                            title: 'South Indian Cinema',
                            imageList: southIndianMovieImageList.sublist(8, 18),
                          ),
                        ],
                      );
                    },
                  ),
                  updatedBool == true ? const HomeAppBar() : const SizedBox(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 3),
      width: double.infinity,
      height: screenSize.width * 0.25,
      color: kBlackColor.withOpacity(0.3),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppBarWidget(
              image: Image.network(
                'https://www.edigitalagency.com.au/wp-content/uploads/netflix-logo-circle-png.png',
                width: 40,
                height: 40,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'Tv Shows',
                style: kTextStyle,
              ),
              Text(
                'Movies',
                style: kTextStyle,
              ),
              Text(
                'Categories',
                style: kTextStyle,
              )
            ],
          ),
        ],
      ),
    );
  }
}
