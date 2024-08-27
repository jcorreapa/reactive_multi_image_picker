import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../reactive_multi_image_picker.dart';
import 'image_source_sheet.dart';
import 'images_previewer.dart';

class ReactiveImagePicker<ModelDataType, ViewDataType>
    extends ReactiveFormField<ModelDataType, ViewDataType> {
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
  final Widget cameraIcon;
  final Widget galleryIcon;
  final Widget cameraLabel;
  final Widget galleryLabel;
  final EdgeInsets bottomSheetPadding;

  final ViewDataType Function(XFile file)? xFileConverter;
  final Widget Function(ViewDataType item)? imageBuilder;

  /// Creates field for picking image(s) from Gallery or Camera.
  ReactiveImagePicker({
    Key? key,
    String? formControlName,
    InputDecoration? decoration,
    FormControl<ModelDataType>? formControl,
    ValidationMessagesFunction<ModelDataType>? validationMessages,
    ControlValueAccessor<ModelDataType, ViewDataType>? valueAccessor,
    ShowErrorsFunction? showErrors,
    ValueChanged<ViewDataType?>? onChanged,
    this.previewWidth = 130,
    this.previewHeight = 130,
    this.previewMargin,
    this.iconColor,
    this.maxHeight,
    this.maxWidth,
    this.imageQuality,
    this.preferredCameraDevice = CameraDevice.rear,
    this.onImage,
    this.cameraIcon = const Icon(Icons.camera_enhance),
    this.galleryIcon = const Icon(Icons.image),
    this.cameraLabel = const Text('Camera'),
    this.galleryLabel = const Text('Gallery'),
    this.bottomSheetPadding = EdgeInsets.zero,
    this.placeholderImage,
    this.xFileConverter,
    this.imageBuilder,
  })  : assert(ViewDataType is XFile || xFileConverter != null,
            "if ViewDataType is not XFile, xFileConverter must be defined"),
        super(
          key: key,
          formControl: formControl,
          formControlName: formControlName,
          valueAccessor: valueAccessor,
          validationMessages: validationMessages,
          showErrors: showErrors,
          builder: (field) {
            final state = field as _ReactiveImagePickerState;
            final theme = Theme.of(state.context);
            final disabledColor = theme.disabledColor;
            final primaryColor = theme.primaryColor;

            final height = field.value != null ? 160.0 : 30.0;
            final width = height;

            return InputDecorator(
              decoration: (decoration ?? InputDecoration()).copyWith(
                filled: false,
                enabled: state.enabled,
                labelText: decoration?.labelText,
                contentPadding: const EdgeInsets.all(8.0),
              ),
              child: ImagePreviewer<ViewDataType>(
                previewHeight: height,
                previewWidth: width,
                image: field.value,
                imageBuilder: imageBuilder,
                deleteImageBuilder: !state.enabled
                    ? null
                    : (context, item) => InkWell(
                          onTap: () {
                            state.requestFocus();
                            field.didChange(null);
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
                addImageWidget: !state.enabled || state.value != null
                    ? null
                    : GestureDetector(
                        child: placeholderImage != null
                            ? Image(
                                width: height,
                                height: width,
                                image: placeholderImage,
                              )
                            : Container(
                                width: width,
                                height: height,
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
                                  field.didChange(xFileConverter != null
                                      ? xFileConverter(image)
                                      : (image as ViewDataType));
                                  onChanged?.call(field.value);
                                  Navigator.pop(state.context);
                                },
                              );
                            },
                          );
                        },
                      ),
              ),
            );
          },
        );

  @override
  _ReactiveImagePickerState<ModelDataType, ViewDataType> createState() =>
      _ReactiveImagePickerState<ModelDataType, ViewDataType>();
}

class _ReactiveImagePickerState<ModelDataType, ViewDataType>
    extends ReactiveFormFieldState<ModelDataType, ViewDataType> {
  bool get enabled => control.enabled;

  requestFocus() => control.focus();
}
