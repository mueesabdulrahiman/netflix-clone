// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_and_new_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotAndNewResp _$HotAndNewRespFromJson(Map<String, dynamic> json) =>
    HotAndNewResp(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => NewAndHotData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HotAndNewRespToJson(HotAndNewResp instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

NewAndHotData _$NewAndHotDataFromJson(Map<String, dynamic> json) =>
    NewAndHotData(
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$NewAndHotDataToJson(NewAndHotData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
    };
