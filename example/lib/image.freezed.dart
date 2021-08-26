// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppImageTearOff {
  const _$AppImageTearOff();

  RemoteImage remote(String url) {
    return RemoteImage(
      url,
    );
  }

  MobileImage mobile(XFile file) {
    return MobileImage(
      file,
    );
  }

  WebImage web(XFile file) {
    return WebImage(
      file,
    );
  }
}

/// @nodoc
const $AppImage = _$AppImageTearOff();

/// @nodoc
mixin _$AppImage {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) remote,
    required TResult Function(XFile file) mobile,
    required TResult Function(XFile file) web,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String url)? remote,
    TResult Function(XFile file)? mobile,
    TResult Function(XFile file)? web,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? remote,
    TResult Function(XFile file)? mobile,
    TResult Function(XFile file)? web,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoteImage value) remote,
    required TResult Function(MobileImage value) mobile,
    required TResult Function(WebImage value) web,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RemoteImage value)? remote,
    TResult Function(MobileImage value)? mobile,
    TResult Function(WebImage value)? web,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteImage value)? remote,
    TResult Function(MobileImage value)? mobile,
    TResult Function(WebImage value)? web,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppImageCopyWith<$Res> {
  factory $AppImageCopyWith(AppImage value, $Res Function(AppImage) then) =
      _$AppImageCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppImageCopyWithImpl<$Res> implements $AppImageCopyWith<$Res> {
  _$AppImageCopyWithImpl(this._value, this._then);

  final AppImage _value;
  // ignore: unused_field
  final $Res Function(AppImage) _then;
}

/// @nodoc
abstract class $RemoteImageCopyWith<$Res> {
  factory $RemoteImageCopyWith(
          RemoteImage value, $Res Function(RemoteImage) then) =
      _$RemoteImageCopyWithImpl<$Res>;
  $Res call({String url});
}

/// @nodoc
class _$RemoteImageCopyWithImpl<$Res> extends _$AppImageCopyWithImpl<$Res>
    implements $RemoteImageCopyWith<$Res> {
  _$RemoteImageCopyWithImpl(
      RemoteImage _value, $Res Function(RemoteImage) _then)
      : super(_value, (v) => _then(v as RemoteImage));

  @override
  RemoteImage get _value => super._value as RemoteImage;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(RemoteImage(
      url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoteImage implements RemoteImage {
  const _$RemoteImage(this.url);

  @override
  final String url;

  @override
  String toString() {
    return 'AppImage.remote(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RemoteImage &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(url);

  @JsonKey(ignore: true)
  @override
  $RemoteImageCopyWith<RemoteImage> get copyWith =>
      _$RemoteImageCopyWithImpl<RemoteImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) remote,
    required TResult Function(XFile file) mobile,
    required TResult Function(XFile file) web,
  }) {
    return remote(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String url)? remote,
    TResult Function(XFile file)? mobile,
    TResult Function(XFile file)? web,
  }) {
    return remote?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? remote,
    TResult Function(XFile file)? mobile,
    TResult Function(XFile file)? web,
    required TResult orElse(),
  }) {
    if (remote != null) {
      return remote(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoteImage value) remote,
    required TResult Function(MobileImage value) mobile,
    required TResult Function(WebImage value) web,
  }) {
    return remote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RemoteImage value)? remote,
    TResult Function(MobileImage value)? mobile,
    TResult Function(WebImage value)? web,
  }) {
    return remote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteImage value)? remote,
    TResult Function(MobileImage value)? mobile,
    TResult Function(WebImage value)? web,
    required TResult orElse(),
  }) {
    if (remote != null) {
      return remote(this);
    }
    return orElse();
  }
}

abstract class RemoteImage implements AppImage {
  const factory RemoteImage(String url) = _$RemoteImage;

  String get url => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteImageCopyWith<RemoteImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MobileImageCopyWith<$Res> {
  factory $MobileImageCopyWith(
          MobileImage value, $Res Function(MobileImage) then) =
      _$MobileImageCopyWithImpl<$Res>;
  $Res call({XFile file});
}

/// @nodoc
class _$MobileImageCopyWithImpl<$Res> extends _$AppImageCopyWithImpl<$Res>
    implements $MobileImageCopyWith<$Res> {
  _$MobileImageCopyWithImpl(
      MobileImage _value, $Res Function(MobileImage) _then)
      : super(_value, (v) => _then(v as MobileImage));

  @override
  MobileImage get _value => super._value as MobileImage;

  @override
  $Res call({
    Object? file = freezed,
  }) {
    return _then(MobileImage(
      file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$MobileImage implements MobileImage {
  const _$MobileImage(this.file);

  @override
  final XFile file;

  @override
  String toString() {
    return 'AppImage.mobile(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MobileImage &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(file);

  @JsonKey(ignore: true)
  @override
  $MobileImageCopyWith<MobileImage> get copyWith =>
      _$MobileImageCopyWithImpl<MobileImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) remote,
    required TResult Function(XFile file) mobile,
    required TResult Function(XFile file) web,
  }) {
    return mobile(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String url)? remote,
    TResult Function(XFile file)? mobile,
    TResult Function(XFile file)? web,
  }) {
    return mobile?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? remote,
    TResult Function(XFile file)? mobile,
    TResult Function(XFile file)? web,
    required TResult orElse(),
  }) {
    if (mobile != null) {
      return mobile(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoteImage value) remote,
    required TResult Function(MobileImage value) mobile,
    required TResult Function(WebImage value) web,
  }) {
    return mobile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RemoteImage value)? remote,
    TResult Function(MobileImage value)? mobile,
    TResult Function(WebImage value)? web,
  }) {
    return mobile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteImage value)? remote,
    TResult Function(MobileImage value)? mobile,
    TResult Function(WebImage value)? web,
    required TResult orElse(),
  }) {
    if (mobile != null) {
      return mobile(this);
    }
    return orElse();
  }
}

abstract class MobileImage implements AppImage {
  const factory MobileImage(XFile file) = _$MobileImage;

  XFile get file => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MobileImageCopyWith<MobileImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebImageCopyWith<$Res> {
  factory $WebImageCopyWith(WebImage value, $Res Function(WebImage) then) =
      _$WebImageCopyWithImpl<$Res>;
  $Res call({XFile file});
}

/// @nodoc
class _$WebImageCopyWithImpl<$Res> extends _$AppImageCopyWithImpl<$Res>
    implements $WebImageCopyWith<$Res> {
  _$WebImageCopyWithImpl(WebImage _value, $Res Function(WebImage) _then)
      : super(_value, (v) => _then(v as WebImage));

  @override
  WebImage get _value => super._value as WebImage;

  @override
  $Res call({
    Object? file = freezed,
  }) {
    return _then(WebImage(
      file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$WebImage implements WebImage {
  const _$WebImage(this.file);

  @override
  final XFile file;

  @override
  String toString() {
    return 'AppImage.web(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WebImage &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(file);

  @JsonKey(ignore: true)
  @override
  $WebImageCopyWith<WebImage> get copyWith =>
      _$WebImageCopyWithImpl<WebImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) remote,
    required TResult Function(XFile file) mobile,
    required TResult Function(XFile file) web,
  }) {
    return web(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String url)? remote,
    TResult Function(XFile file)? mobile,
    TResult Function(XFile file)? web,
  }) {
    return web?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? remote,
    TResult Function(XFile file)? mobile,
    TResult Function(XFile file)? web,
    required TResult orElse(),
  }) {
    if (web != null) {
      return web(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoteImage value) remote,
    required TResult Function(MobileImage value) mobile,
    required TResult Function(WebImage value) web,
  }) {
    return web(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RemoteImage value)? remote,
    TResult Function(MobileImage value)? mobile,
    TResult Function(WebImage value)? web,
  }) {
    return web?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteImage value)? remote,
    TResult Function(MobileImage value)? mobile,
    TResult Function(WebImage value)? web,
    required TResult orElse(),
  }) {
    if (web != null) {
      return web(this);
    }
    return orElse();
  }
}

abstract class WebImage implements AppImage {
  const factory WebImage(XFile file) = _$WebImage;

  XFile get file => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebImageCopyWith<WebImage> get copyWith =>
      throw _privateConstructorUsedError;
}
