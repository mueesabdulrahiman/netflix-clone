import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/application/fast_laugh/fastlaugh_bloc.dart';
import 'package:netfilx/presentation/fast_and_laughs/widgets/video_list_item.dart';

class ScreenFastAndLaughs extends StatelessWidget {
  const ScreenFastAndLaughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastlaughBloc>(context)
          .add(const FastlaughEvent.initailze());
    });

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastlaughBloc, FastlaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.isError) {
              return const Center(
                child: Text('Error while loading video'),
              );
            } else if (state.videoList.isEmpty) {
              return const Center(
                child: Text('Oops!, Video not found '),
              );
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                    state.videoList.length,
                    (index) => VideoListItemInheritedWidget(
                        widget: VideoListItem(
                          index: index,
                          key: Key(index.toString()),
                        ),
                        movieData: state.videoList[index])),
              );
            }
          },
        ),
      ),
    );
  }
}
