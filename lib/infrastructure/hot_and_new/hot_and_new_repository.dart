import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netfilx/domain/core/api_end_points.dart';
import 'package:netfilx/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netfilx/domain/new_and_hot/i_hot_and_new_repo.dart';
import 'package:netfilx/domain/new_and_hot/models/hot_and_new_resp/hot_and_new_resp.dart';

@LazySingleton(as: IHotAndNewRepo)
class HotAndNewRepository implements IHotAndNewRepo {
  @override
  Future<Either<MainFailure, HotAndNewResp>> getPopularMoviesData() async {
    try {
      final response =
          await Dio(BaseOptions()).get(ApiEndPoints.everyOneWatchingMovies);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final _result = HotAndNewResp.fromJson(response.data);
        return Right(_result);
      } else {
        return const Left(MainFailure.serverFailure());
      }

    } 
    
    catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNewResp>> getUpcomingMoviesData() async {
    try {
      final response =
          await Dio(BaseOptions()).get(ApiEndPoints.upcomingMovies);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final _result = HotAndNewResp.fromJson(response.data);
        return Right(_result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
