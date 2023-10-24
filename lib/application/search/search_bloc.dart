import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netfilx/domain/core/failures/main_failures.dart';
import 'package:netfilx/domain/downloads/i_downloads_repo.dart';
import 'package:netfilx/domain/downloads/models/downloads.dart';
import 'package:netfilx/domain/search/i_search_repo.dart';
import 'package:netfilx/domain/search/models/search_resp/search_resp.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _iDownloadsRepo;
  final ISearchRepo _iSearchRepo;
  SearchBloc(this._iDownloadsRepo, this._iSearchRepo)
      : super(SearchState.initial()) {
    // idlelist state
    on<_Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(state);
        return;
      }
      // // get trending
      emit(
        const SearchState(
          searchDataList: [],
          idleList: [],
          isLoading: true,
          isError: false,
        ),
      );

      final _result = await _iDownloadsRepo.getDownloadsImage();

      _result.fold(
        (MainFailure failure) => emit(
          const SearchState(
            searchDataList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          ),
        ),
        (List<Downloads> downloads) => emit(
          SearchState(
            searchDataList: [],
            idleList: downloads,
            isLoading: false,
            isError: false,
          ),
        ),
      );

      //show to ui
    });

    // search movies state
    on<_SearchMovie>((event, emit) async {
      emit(
        const SearchState(
          searchDataList: [],
          idleList: [],
          isLoading: true,
          isError: false,
        ),
      );

      //call search movie api
      final _result =
          await _iSearchRepo.searchMovies(movieQuery: event.movieQuery);
      log(_result.toString());

      final _state = _result.fold((MainFailure l) {
        return const SearchState(
          searchDataList: [],
          idleList: [],
          isLoading: false,
          isError: true,
        );
      }, (SearchResp s) {
        return SearchState(
          searchDataList: s.results,
          idleList: [],
          isLoading: false,
          isError: false,
        );
      });
      emit(_state);

      //show to ui
    });
  }
}
