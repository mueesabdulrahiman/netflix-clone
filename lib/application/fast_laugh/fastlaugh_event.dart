part of 'fastlaugh_bloc.dart';

@freezed
class FastlaughEvent with _$FastlaughEvent {
  const factory FastlaughEvent.initailze() = _Initailze;
  const factory FastlaughEvent.likedVideos() = _LikedVideos;
  const factory FastlaughEvent.unLikedVideos() = _UnLikedVideos;
}
