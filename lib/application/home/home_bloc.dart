import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netfilx/domain/core/failures/main_failures.dart';
import 'package:netfilx/domain/new_and_hot/i_hot_and_new_repo.dart';
import 'package:netfilx/domain/new_and_hot/models/hot_and_new_resp/hot_and_new_resp.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHotAndNewRepo iHomeRepo;
  HomeBloc(this.iHomeRepo) : super(HomeState.initial()) {
    on<_GetDataInHomePage>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      final _result1 = await iHomeRepo.getUpcomingMoviesData();
      final _result2 = await iHomeRepo.getPopularMoviesData();

      final _state1 = _result1.fold(
          (MainFailure failure) => state.copyWith(
                stateId: DateTime.now().millisecondsSinceEpoch.toString(),
                isError: true,
                isLoading: false,
              ), (HotAndNewResp resp) {
        final pastYearMovieDataList = resp.results;
        pastYearMovieDataList.shuffle();
        final trendingNowMovieDataList = resp.results;
        trendingNowMovieDataList.shuffle();
        final tenseDramasMovieDataList = resp.results;
        tenseDramasMovieDataList.shuffle();

        final southIndianMovieDataList = resp.results;
        southIndianMovieDataList.shuffle();

        return state.copyWith(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          isLoading: false,
          pastYearMovieData: pastYearMovieDataList,
          trendingNowMovieData: trendingNowMovieDataList,
          tenseDramasMovieData: tenseDramasMovieDataList,
          southIndianMovieData: southIndianMovieDataList,
          topTvData: state.topTvData,
        );
      });
      emit(_state1);

      final _state2 = _result2.fold(
          (l) => state.copyWith(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              isLoading: false,
              isError: true),
          (r) => state.copyWith(
                stateId: DateTime.now().millisecondsSinceEpoch.toString(),
                isLoading: false,
                pastYearMovieData: state.pastYearMovieData,
                trendingNowMovieData: state.trendingNowMovieData,
                tenseDramasMovieData: state.tenseDramasMovieData,
                southIndianMovieData: state.southIndianMovieData,
                topTvData: r.results,
              ));
      emit(_state2);
    });
  }
}
