import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netfilx/domain/downloads/i_downloads_repo.dart';
import 'package:netfilx/domain/downloads/models/downloads.dart';


part 'fastlaugh_event.dart';
part 'fastlaugh_state.dart';
part 'fastlaugh_bloc.freezed.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
];
ValueNotifier<Set<int>> likeVideosIdsNotifier = ValueNotifier({});

@injectable
class FastlaughBloc extends Bloc<FastlaughEvent, FastlaughState> {
  final IDownloadsRepo _iDownloadsRepo;
  FastlaughBloc(this._iDownloadsRepo) : super(FastlaughState.initial()) {
   
    on<_Initailze>((event, emit) async {
       if (state.videoList.isNotEmpty) {
      emit(state);
      return;
    }
      emit(const FastlaughState(
        videoList: [],
        isLoading: true,
        isError: false,
      ));

      final _result = await _iDownloadsRepo.getDownloadsImage();
      final _state = _result.fold(
          (l) => const FastlaughState(
              videoList: [], isLoading: false, isError: true),
          (resp) => FastlaughState(
              videoList: resp, isLoading: false, isError: false));

      emit(_state);
    });
  }
}
