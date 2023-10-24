import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netfilx/domain/core/failures/main_failures.dart';
import 'package:netfilx/domain/downloads/i_downloads_repo.dart';
import 'package:netfilx/domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo iDownloadsRepo;
  DownloadsBloc(this.iDownloadsRepo) : super(DownloadsState.initial()) {
   
    on<_GetDownloadsImage>((event, emit) async {
      
      final Either<MainFailure, List<Downloads>> downloadsOption =
          await iDownloadsRepo.getDownloadsImage();

      emit(
        downloadsOption.fold(
          (failure) => state.copyWith(
            isLoading: false,
            downloadsFailureOrSuccessOption: Some(Left(failure)),
          ),
          (success) => state.copyWith(
              isLoading: false,
              downloads: success,
              downloadsFailureOrSuccessOption: Some(Right(success))),
        ),
      );
    });
  }
}
