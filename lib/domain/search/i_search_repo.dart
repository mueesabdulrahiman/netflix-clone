import 'package:dartz/dartz.dart';
import 'package:netfilx/domain/core/failures/main_failures.dart';
import 'package:netfilx/domain/search/models/search_resp/search_resp.dart';

abstract class ISearchRepo {
  Future<Either<MainFailure, SearchResp>> searchMovies(
      {required String movieQuery});
}
