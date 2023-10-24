import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netfilx/domain/core/api_end_points.dart';
import 'package:netfilx/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netfilx/domain/downloads/i_downloads_repo.dart';
import 'package:netfilx/domain/downloads/models/downloads.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImage() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      final res = response.data;
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downLoadsList = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();
        return Right(downLoadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
