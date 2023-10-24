part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewEvent with _$HotAndNewEvent {
  const factory HotAndNewEvent.loadDataInComingSoon() = _LoadDataInComingSoon;
  const factory HotAndNewEvent.loadDataInEveryonesWatching() = _loadDataInEveryonesWatching;

}