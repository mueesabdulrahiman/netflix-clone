part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required List<NewAndHotData> comingSoonList,
    required List<NewAndHotData> everyonesWatchingList,
    required bool isLoading,
    required bool isError,
  }) = _HotAndNewState;

  factory HotAndNewState.initial() {
    return const HotAndNewState(
      comingSoonList: [],
      everyonesWatchingList: [],
      isLoading: false,
      isError: false,
    );
  }
}
