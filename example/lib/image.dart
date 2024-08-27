import 'package:cross_file/cross_file.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';

@freezed
class AppImage with _$AppImage {
  const factory AppImage.remote(String url) = RemoteImage;
  const factory AppImage.mobile(XFile file) = MobileImage;
  const factory AppImage.web(XFile file) = WebImage;
}
