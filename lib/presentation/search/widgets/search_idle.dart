import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/application/search/search_bloc.dart';
import 'package:netfilx/core/constants.dart';
import 'package:netfilx/core/strings.dart';
import 'package:netfilx/presentation/main_page/screen_main_page.dart';
import 'package:netfilx/presentation/widgets/main_title.dart';

class SearchIdle extends StatelessWidget {
  const SearchIdle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        BlocProvider.of<SearchBloc>(context)
            .add(const SearchEvent.initialize()));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          title: 'Top Searches',
        ),
        kHeightLarge,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } 
              else if (state.isError) {
                return const Center(
                  child: Text('Error While getting data'),
                );
              } 
              else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text(' List is empty'),
                );
              }
              return ListView.separated(
                //shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  final movie = state.idleList[index];
                  return SearchIdleTile(
                    imageString: '$kImageAppendUrl${movie.posterPath}',
                    title: movie.title ?? 'No title provided',
                  );
                },
                separatorBuilder: (ctx, index) => kHeightLarge,
                itemCount: state.idleList.length,
              );
            },
          ),
        ),
      ],
    );
  }
}

class SearchIdleTile extends StatelessWidget {
  const SearchIdleTile(
      {Key? key, required this.imageString, required this.title})
      : super(key: key);

  final String imageString;
  final String title;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: screenWidth * 0.4,
          height: screenSize.height * 0.12,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageString),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        kWidth,
        Expanded(
          child: Text(title),
        ),
        kWidth,
        const PlayIcon(),
      ],
    );
  }
}

class PlayIcon extends StatelessWidget {
  const PlayIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: kWhiteColor,
      radius: 25.0,
      child: CircleAvatar(
        backgroundColor: kBlackColor,
        radius: 22.0,
        child: Icon(
          CupertinoIcons.play_fill,
          color: kWhiteColor,
        ),
      ),
    );
  }
}
