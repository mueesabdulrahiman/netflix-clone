part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required bool isLoading,
    required bool isError,
    required List<NewAndHotData> pastYearMovieData,
    required List<NewAndHotData> trendingNowMovieData,
    required List<NewAndHotData> tenseDramasMovieData,
    required List<NewAndHotData> southIndianMovieData,
    required List<NewAndHotData> topTvData,
  }) = _HomeState;

  factory HomeState.initial() {
    return const HomeState(
      stateId: '0',
      isLoading: false,
      isError: false,
      pastYearMovieData: [],
      trendingNowMovieData: [],
      tenseDramasMovieData: [],
      southIndianMovieData: [],
      topTvData: []
    );

  }

  
}
