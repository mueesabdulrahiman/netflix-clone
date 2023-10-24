// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDataInHomePage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getDataInHomePage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDataInHomePage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDataInHomePage value) getDataInHomePage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetDataInHomePage value)? getDataInHomePage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDataInHomePage value)? getDataInHomePage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res> implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  final HomeEvent _value;
  // ignore: unused_field
  final $Res Function(HomeEvent) _then;
}

/// @nodoc
abstract class _$$_GetDataInHomePageCopyWith<$Res> {
  factory _$$_GetDataInHomePageCopyWith(_$_GetDataInHomePage value,
          $Res Function(_$_GetDataInHomePage) then) =
      __$$_GetDataInHomePageCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetDataInHomePageCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res>
    implements _$$_GetDataInHomePageCopyWith<$Res> {
  __$$_GetDataInHomePageCopyWithImpl(
      _$_GetDataInHomePage _value, $Res Function(_$_GetDataInHomePage) _then)
      : super(_value, (v) => _then(v as _$_GetDataInHomePage));

  @override
  _$_GetDataInHomePage get _value => super._value as _$_GetDataInHomePage;
}

/// @nodoc

class _$_GetDataInHomePage implements _GetDataInHomePage {
  const _$_GetDataInHomePage();

  @override
  String toString() {
    return 'HomeEvent.getDataInHomePage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetDataInHomePage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDataInHomePage,
  }) {
    return getDataInHomePage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getDataInHomePage,
  }) {
    return getDataInHomePage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDataInHomePage,
    required TResult orElse(),
  }) {
    if (getDataInHomePage != null) {
      return getDataInHomePage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDataInHomePage value) getDataInHomePage,
  }) {
    return getDataInHomePage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetDataInHomePage value)? getDataInHomePage,
  }) {
    return getDataInHomePage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDataInHomePage value)? getDataInHomePage,
    required TResult orElse(),
  }) {
    if (getDataInHomePage != null) {
      return getDataInHomePage(this);
    }
    return orElse();
  }
}

abstract class _GetDataInHomePage implements HomeEvent {
  const factory _GetDataInHomePage() = _$_GetDataInHomePage;
}

/// @nodoc
mixin _$HomeState {
  String get stateId => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  List<NewAndHotData> get pastYearMovieData =>
      throw _privateConstructorUsedError;
  List<NewAndHotData> get trendingNowMovieData =>
      throw _privateConstructorUsedError;
  List<NewAndHotData> get tenseDramasMovieData =>
      throw _privateConstructorUsedError;
  List<NewAndHotData> get southIndianMovieData =>
      throw _privateConstructorUsedError;
  List<NewAndHotData> get topTvData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {String stateId,
      bool isLoading,
      bool isError,
      List<NewAndHotData> pastYearMovieData,
      List<NewAndHotData> trendingNowMovieData,
      List<NewAndHotData> tenseDramasMovieData,
      List<NewAndHotData> southIndianMovieData,
      List<NewAndHotData> topTvData});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? stateId = freezed,
    Object? isLoading = freezed,
    Object? isError = freezed,
    Object? pastYearMovieData = freezed,
    Object? trendingNowMovieData = freezed,
    Object? tenseDramasMovieData = freezed,
    Object? southIndianMovieData = freezed,
    Object? topTvData = freezed,
  }) {
    return _then(_value.copyWith(
      stateId: stateId == freezed
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      pastYearMovieData: pastYearMovieData == freezed
          ? _value.pastYearMovieData
          : pastYearMovieData // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
      trendingNowMovieData: trendingNowMovieData == freezed
          ? _value.trendingNowMovieData
          : trendingNowMovieData // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
      tenseDramasMovieData: tenseDramasMovieData == freezed
          ? _value.tenseDramasMovieData
          : tenseDramasMovieData // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
      southIndianMovieData: southIndianMovieData == freezed
          ? _value.southIndianMovieData
          : southIndianMovieData // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
      topTvData: topTvData == freezed
          ? _value.topTvData
          : topTvData // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
    ));
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String stateId,
      bool isLoading,
      bool isError,
      List<NewAndHotData> pastYearMovieData,
      List<NewAndHotData> trendingNowMovieData,
      List<NewAndHotData> tenseDramasMovieData,
      List<NewAndHotData> southIndianMovieData,
      List<NewAndHotData> topTvData});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, (v) => _then(v as _$_HomeState));

  @override
  _$_HomeState get _value => super._value as _$_HomeState;

  @override
  $Res call({
    Object? stateId = freezed,
    Object? isLoading = freezed,
    Object? isError = freezed,
    Object? pastYearMovieData = freezed,
    Object? trendingNowMovieData = freezed,
    Object? tenseDramasMovieData = freezed,
    Object? southIndianMovieData = freezed,
    Object? topTvData = freezed,
  }) {
    return _then(_$_HomeState(
      stateId: stateId == freezed
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      pastYearMovieData: pastYearMovieData == freezed
          ? _value._pastYearMovieData
          : pastYearMovieData // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
      trendingNowMovieData: trendingNowMovieData == freezed
          ? _value._trendingNowMovieData
          : trendingNowMovieData // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
      tenseDramasMovieData: tenseDramasMovieData == freezed
          ? _value._tenseDramasMovieData
          : tenseDramasMovieData // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
      southIndianMovieData: southIndianMovieData == freezed
          ? _value._southIndianMovieData
          : southIndianMovieData // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
      topTvData: topTvData == freezed
          ? _value._topTvData
          : topTvData // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {required this.stateId,
      required this.isLoading,
      required this.isError,
      required final List<NewAndHotData> pastYearMovieData,
      required final List<NewAndHotData> trendingNowMovieData,
      required final List<NewAndHotData> tenseDramasMovieData,
      required final List<NewAndHotData> southIndianMovieData,
      required final List<NewAndHotData> topTvData})
      : _pastYearMovieData = pastYearMovieData,
        _trendingNowMovieData = trendingNowMovieData,
        _tenseDramasMovieData = tenseDramasMovieData,
        _southIndianMovieData = southIndianMovieData,
        _topTvData = topTvData;

  @override
  final String stateId;
  @override
  final bool isLoading;
  @override
  final bool isError;
  final List<NewAndHotData> _pastYearMovieData;
  @override
  List<NewAndHotData> get pastYearMovieData {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pastYearMovieData);
  }

  final List<NewAndHotData> _trendingNowMovieData;
  @override
  List<NewAndHotData> get trendingNowMovieData {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingNowMovieData);
  }

  final List<NewAndHotData> _tenseDramasMovieData;
  @override
  List<NewAndHotData> get tenseDramasMovieData {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tenseDramasMovieData);
  }

  final List<NewAndHotData> _southIndianMovieData;
  @override
  List<NewAndHotData> get southIndianMovieData {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_southIndianMovieData);
  }

  final List<NewAndHotData> _topTvData;
  @override
  List<NewAndHotData> get topTvData {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topTvData);
  }

  @override
  String toString() {
    return 'HomeState(stateId: $stateId, isLoading: $isLoading, isError: $isError, pastYearMovieData: $pastYearMovieData, trendingNowMovieData: $trendingNowMovieData, tenseDramasMovieData: $tenseDramasMovieData, southIndianMovieData: $southIndianMovieData, topTvData: $topTvData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            const DeepCollectionEquality().equals(other.stateId, stateId) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isError, isError) &&
            const DeepCollectionEquality()
                .equals(other._pastYearMovieData, _pastYearMovieData) &&
            const DeepCollectionEquality()
                .equals(other._trendingNowMovieData, _trendingNowMovieData) &&
            const DeepCollectionEquality()
                .equals(other._tenseDramasMovieData, _tenseDramasMovieData) &&
            const DeepCollectionEquality()
                .equals(other._southIndianMovieData, _southIndianMovieData) &&
            const DeepCollectionEquality()
                .equals(other._topTvData, _topTvData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stateId),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isError),
      const DeepCollectionEquality().hash(_pastYearMovieData),
      const DeepCollectionEquality().hash(_trendingNowMovieData),
      const DeepCollectionEquality().hash(_tenseDramasMovieData),
      const DeepCollectionEquality().hash(_southIndianMovieData),
      const DeepCollectionEquality().hash(_topTvData));

  @JsonKey(ignore: true)
  @override
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final String stateId,
      required final bool isLoading,
      required final bool isError,
      required final List<NewAndHotData> pastYearMovieData,
      required final List<NewAndHotData> trendingNowMovieData,
      required final List<NewAndHotData> tenseDramasMovieData,
      required final List<NewAndHotData> southIndianMovieData,
      required final List<NewAndHotData> topTvData}) = _$_HomeState;

  @override
  String get stateId => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get isError => throw _privateConstructorUsedError;
  @override
  List<NewAndHotData> get pastYearMovieData =>
      throw _privateConstructorUsedError;
  @override
  List<NewAndHotData> get trendingNowMovieData =>
      throw _privateConstructorUsedError;
  @override
  List<NewAndHotData> get tenseDramasMovieData =>
      throw _privateConstructorUsedError;
  @override
  List<NewAndHotData> get southIndianMovieData =>
      throw _privateConstructorUsedError;
  @override
  List<NewAndHotData> get topTvData => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
