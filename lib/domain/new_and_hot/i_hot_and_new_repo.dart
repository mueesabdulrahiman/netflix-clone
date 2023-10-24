import 'package:dartz/dartz.dart';
import 'package:netfilx/domain/core/failures/main_failures.dart';
import 'package:netfilx/domain/new_and_hot/models/hot_and_new_resp/hot_and_new_resp.dart';

abstract class IHotAndNewRepo {
  Future<Either<MainFailure, HotAndNewResp>> getUpcomingMoviesData();
  Future<Either<MainFailure, HotAndNewResp>> getPopularMoviesData();
}
