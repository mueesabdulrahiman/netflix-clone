import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netfilx/domain/core/api_end_points.dart';
import 'package:netfilx/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netfilx/domain/search/i_search_repo.dart';
import 'package:netfilx/domain/search/models/search_resp/search_resp.dart';

@LazySingleton(as: ISearchRepo)
class SearchRepository implements ISearchRepo {
  @override
  Future<Either<MainFailure, SearchResp>> searchMovies({
    required String movieQuery,
  }) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {
          'query': movieQuery,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch(_){
       return const Left(MainFailure.serverFailure());
    }
    catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
