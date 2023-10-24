import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netfilx/domain/core/failures/main_failures.dart';
import 'package:netfilx/domain/new_and_hot/i_hot_and_new_repo.dart';
import 'package:netfilx/domain/new_and_hot/models/hot_and_new_resp/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final IHotAndNewRepo iHotAndNewRepo;
  HotAndNewBloc(this.iHotAndNewRepo) : super(HotAndNewState.initial()) {
    on<_LoadDataInComingSoon>((event, emit) async {
      if (state.comingSoonList.isNotEmpty) {
        emit(state);
        return;
      }
      emit(state.copyWith(
        isLoading: true,
      ));
      final _result = await iHotAndNewRepo.getUpcomingMoviesData();
      final _state = _result.fold(
          (MainFailure failure) =>
              state.copyWith(isLoading: false, isError: true),
          (HotAndNewResp resp) => state.copyWith(
                isLoading: false,
                comingSoonList: resp.results,
                everyonesWatchingList: state.everyonesWatchingList,
              ));
      emit(_state);
    });
    on<_loadDataInEveryonesWatching>((event, emit) async {
      if (state.everyonesWatchingList.isNotEmpty) {
        emit(state);
        return;
      }
      emit(state.copyWith(
        isLoading: true,
      ));
      final _result = await iHotAndNewRepo.getPopularMoviesData();
      final _state = _result.fold(
          (MainFailure failure) => state.copyWith(
                isLoading: false,
                isError: true,
              ),
          (HotAndNewResp resp) => state.copyWith(
                isLoading: false,
                everyonesWatchingList: resp.results,
                comingSoonList: state.comingSoonList,
              ));
      emit(_state);
    });
  }
}
