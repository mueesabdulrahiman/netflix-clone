part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<SearchResultData> searchDataList,
    required List<Downloads> idleList,
    required bool isLoading,
    required bool isError,
  }) = _SearchState;

  factory SearchState.initial() {
    return const SearchState(
        searchDataList: [], idleList: [], isLoading: false, isError: false);
  }
}
