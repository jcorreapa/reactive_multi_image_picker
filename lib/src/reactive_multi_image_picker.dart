import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:image_picker/image_picker.dart';

import 'full_screen_viewer.dart';
import 'image_source_sheet.dart';

/// Field for picking image(s) from Gallery or Camera.
/// TODO: review the types
class ReactiveMultiImagePicker<ModelDataType, ViewDataType>
    extends ReactiveFormField<List<ModelDataType>, List<ViewDataType>> {
  //TODO: Add documentation
  final double previewWidth;
  final double previewHeight;
  final EdgeInsets? previewMargin;
  final ImageProvider? placeholderImage;

  final Color? iconColor;

  /// Optional maximum height of image; see [ImagePicker].
  final double? maxHeight;

  /// Optional maximum width of image; see [ImagePicker].
  final double? maxWidth;

  /// The imageQuality argument modifies the quality of the image, ranging from
  /// 0-100 where 100 is the original/max quality. If imageQuality is null, the
  /// image with the original quality will be returned. See [ImagePicker].
  final int? imageQuality;

  /// Use preferredCameraDevice to specify the camera to use when the source is
  /// `ImageSource.camera`. The preferredCameraDevice is ignored when source is
  /// `ImageSource.gallery`. It is also ignored if the chosen camera is not
  /// supported on the device. Defaults to `CameraDevice.rear`. See [ImagePicker].
  final CameraDevice preferredCameraDevice;

  final void Function(Image)? onImage;
  final int? maxImages;
  final Widget cameraIcon;
  final Widget galleryIcon;
  final Widget cameraLabel;
  final Widget galleryLabel;
  final EdgeInsets bottomSheetPadding;

  /// Creates field for picking image(s) from Gallery or Camera.
  ReactiveMultiImagePicker({
    Key? key,
    String? formControlName,
    InputDecoration? decoration,
    FormControl<List<ModelDataType>>? formControl,
    ValidationMessagesFunction<List<ModelDataType>>? validationMessages,
    ControlValueAccessor<List<ModelDataType>, List<ViewDataType>>?
        valueAccessor,
    ShowErrorsFunction? showErrors,
    ValueChanged<List<ViewDataType>?>? onChanged,
    this.previewWidth = 130,
    this.previewHeight = 130,
    this.previewMargin,
    this.iconColor,
    this.maxHeight,
    this.maxWidth,
    this.imageQuality,
    this.preferredCameraDevice = CameraDevice.rear,
    this.onImage,
    this.maxImages,
    this.cameraIcon = const Icon(Icons.camera_enhance),
    this.galleryIcon = const Icon(Icons.image),
    this.cameraLabel = const Text('Camera'),
    this.galleryLabel = const Text('Gallery'),
    this.bottomSheetPadding = EdgeInsets.zero,
    this.placeholderImage,
  })  : assert(maxImages == null || maxImages >= 0),
        super(
          key: key,
          formControl: formControl,
          formControlName: formControlName,
          valueAccessor: valueAccessor,
          validationMessages: validationMessages,
          showErrors: showErrors,
          builder: (field) {
            final state = field as _ReactiveMultiImagePickerState;
            final theme = Theme.of(state.context);
            final disabledColor = theme.disabledColor;
            final primaryColor = theme.primaryColor;

            return InputDecorator(
              decoration: (decoration ?? InputDecoration()).copyWith(
                  filled: false,
                  enabled: state.enabled,
                  labelText: decoration?.labelText,
                  contentPadding: const EdgeInsets.all(8.0)),
              child: Container(
                height: previewHeight,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    if (field.value != null)
                      ...field.value!.map<Widget>((item) {
                        assert(item is File ||
                            item is String ||
                            item is Uint8List);
                        return Stack(
                          alignment: Alignment.topRight,
                          children: <Widget>[
                            Container(
                              width: previewWidth,
                              height: previewHeight,
                              margin: previewMargin,
                              child: FullScreenViewer(
                                child: kIsWeb
                                    ? Image.memory(item as Uint8List,
                                        fit: BoxFit.cover)
                                    : item is String
                                        ? Image.network(item, fit: BoxFit.cover)
                                        : Image.file(item as File,
                                            fit: BoxFit.cover),
                              ),
                            ),
                            if (state.enabled)
                              InkWell(
                                onTap: () {
                                  state.requestFocus();
                                  field.didChange(
                                    [...?field.value]..removeWhere(
                                        (e) => e.toString() == item.toString(),
                                        // Hmmmmmmm
                                      ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.7),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  height: 22,
                                  width: 22,
                                  child: const Icon(
                                    Icons.close,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                          ],
                        );
                      }),
                    if (state.enabled && !state.hasMaxImages)
                      GestureDetector(
                        child: placeholderImage != null
                            ? Image(
                                width: previewWidth,
                                height: previewHeight,
                                image: placeholderImage,
                              )
                            : Container(
                                width: previewWidth,
                                height: previewHeight,
                                child: Icon(
                                  Icons.camera_enhance,
                                  color: state.enabled
                                      ? iconColor ?? primaryColor
                                      : disabledColor,
                                ),
                                color: (state.enabled
                                        ? iconColor ?? primaryColor
                                        : disabledColor)
                                    .withAlpha(50)),
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: state.context,
                            builder: (_) {
                              return ImageSourceBottomSheet(
                                maxHeight: maxHeight,
                                maxWidth: maxWidth,
                                imageQuality: imageQuality,
                                preferredCameraDevice: preferredCameraDevice,
                                bottomSheetPadding: bottomSheetPadding,
                                cameraIcon: cameraIcon,
                                cameraLabel: cameraLabel,
                                galleryIcon: galleryIcon,
                                galleryLabel: galleryLabel,
                                onImageSelected: (image) {
                                  state.requestFocus();
                                  field.didChange(
                                      [...?field.value, image as ViewDataType]);
                                  Navigator.pop(state.context);
                                },
                                onImage: (image) {
                                  field.didChange(
                                      [...?field.value, image as ViewDataType]);
                                  onChanged?.call(field.value);
                                  Navigator.pop(state.context);
                                },
                              );
                            },
                          );
                        },
                      ),
                  ],
                ),
              ),
            );
          },
        );

  @override
  _ReactiveMultiImagePickerState<ModelDataType, ViewDataType> createState() =>
      _ReactiveMultiImagePickerState<ModelDataType, ViewDataType>();
}

class _ReactiveMultiImagePickerState<ModelDataType, ViewDataType>
    extends ReactiveFormFieldState<List<ModelDataType>, List<ViewDataType>> {
  bool get hasMaxImages =>
      (widget as ReactiveMultiImagePicker).maxImages != null &&
      value != null &&
      value!.length >= (widget as ReactiveMultiImagePicker).maxImages!;
  bool get enabled => control.enabled;
  requestFocus() => control.focus();
}
