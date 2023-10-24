import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netfilx/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netfilx/core/constants.dart';
import 'package:netfilx/core/strings.dart';
import 'package:netfilx/presentation/new_and_hot/widgets/coming_soon_section.dart';
import 'package:netfilx/presentation/new_and_hot/widgets/everyone_watching_section.dart';
import 'package:netfilx/presentation/widgets/app_bar_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: AppBarWidget(
            title: 'New & Hot',
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TabBar(
                  isScrollable: true,
                  labelColor: kBlackColor,
                  unselectedLabelColor: kWhiteColor,
                  unselectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.bold),
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  tabs: const [
                    Tab(
                      text: '🍿 Coming Soon',
                    ),
                    Tab(
                      text: "👀 Everyone's Watching",
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    ComingSoonList(
                      key: Key('coming_soon'),
                    ),
                    EveryonesWatchingList(
                      key: Key('everyones_watching'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EveryonesWatchingList extends StatelessWidget {
  const EveryonesWatchingList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const HotAndNewEvent.loadDataInEveryonesWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const HotAndNewEvent.loadDataInEveryonesWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError == true) {
            return const Center(
              child: Text('Error while loading data'),
            );
          } else if (state.everyonesWatchingList.isEmpty) {
            return const Center(
              child: Text('Data not found'),
            );
          }

          return ListView.builder(
            itemCount: state.everyonesWatchingList.length,
            itemBuilder: (context, index) {
              final movie = state.everyonesWatchingList[index];
              return EveryoneWatchingSection(
                description: movie.overview ?? 'No Description',
                movieName: movie.originalTitle ?? 'No Title',
                posterPath: '$kImageAppendUrl${movie.posterPath}',
              );
            },
          );
        },
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const HotAndNewEvent.loadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const HotAndNewEvent.loadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError == true) {
            return const Center(
              child: Text('Error while loading data'),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text('Data not found'),
            );
          }
          return ListView.builder(
            itemCount: state.comingSoonList.length,
            itemBuilder: (BuildContext ctx, index) {
              final movie = state.comingSoonList[index];
              if (movie.id == null) {
                return const SizedBox();
              }
              log(movie.releaseDate.toString());
              late String day;
              late String month;
              late String dayInWords;
              try {
                final _date = DateTime.tryParse(movie.releaseDate!);
                final formatedDate = DateFormat.yMMMMd('en_US').format(_date!);
                month = formatedDate.split(' ').first.substring(0, 3);
                day = movie.releaseDate!.split('-')[1];
                dayInWords = DateFormat('EEEE').format(_date);
              } catch (_) {
                day = '';
                month = '';
                dayInWords = '';
              }
              return ComingSoonSection(
                day: day,
                dayInWords: dayInWords,
                description: movie.overview ?? 'No description',
                id: movie.id.toString(),
                month: month,
                movieName: movie.title ?? 'No title',
                posterPath: '$kImageAppendUrl${movie.posterPath}',
              );
            },
          );
        },
      ),
    );
  }
}
