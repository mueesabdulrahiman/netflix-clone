import 'package:json_annotation/json_annotation.dart';

part 'hot_and_new_resp.g.dart';

@JsonSerializable()
class HotAndNewResp {
  @JsonKey(name: 'results')
  List<NewAndHotData> results;

  HotAndNewResp({this.results = const []});

  factory HotAndNewResp.fromJson(Map<String, dynamic> json) {
    return _$HotAndNewRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotAndNewRespToJson(this);
}

@JsonSerializable()
class NewAndHotData {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'title')
  String? title;

  NewAndHotData({
    this.id,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  factory NewAndHotData.fromJson(Map<String, dynamic> json) {
    return _$NewAndHotDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewAndHotDataToJson(this);
}
