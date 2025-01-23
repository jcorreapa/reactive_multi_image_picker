import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reactive_multi_image_picker/src/image_saver.dart';

import 'take_picture_page.dart';

class ImageSourceBottomSheet extends StatefulWidget {
  /// Optional maximum height of image
  final double? maxHeight;

  /// Optional maximum width of image
  final double? maxWidth;

  /// The imageQuality argument modifies the quality of the image, ranging from
  /// 0-100 where 100 is the original/max quality. If imageQuality is null, the
  /// image with the original quality will be returned.
  final int? imageQuality;

  /// Use preferredCameraDevice to specify the camera to use when the source is
  /// `ImageSource.camera`. The preferredCameraDevice is ignored when source is
  /// `ImageSource.gallery`. It is also ignored if the chosen camera is not
  /// supported on the device. Defaults to `CameraDevice.rear`.
  final CameraDevice preferredCameraDevice;

  /// Callback when an image is selected.
  ///
  /// **Warning**: This will _NOT_ work on web platform because [File] is not
  /// available.
  final void Function(XFile) onImageSelected;

  final Widget? cameraIcon;
  final Widget? galleryIcon;
  final Widget? cameraLabel;
  final Widget? galleryLabel;
  final EdgeInsets? bottomSheetPadding;

  ImageSourceBottomSheet({
    Key? key,
    this.maxHeight,
    this.maxWidth,
    this.imageQuality,
    this.preferredCameraDevice = CameraDevice.rear,
    required this.onImageSelected,
    this.cameraIcon,
    this.galleryIcon,
    this.cameraLabel,
    this.galleryLabel,
    this.bottomSheetPadding,
  }) : super(key: key);

  @override
  _ImageSourceBottomSheetState createState() => _ImageSourceBottomSheetState();
}

class _ImageSourceBottomSheetState extends State<ImageSourceBottomSheet> {
  bool _isPickingImage = false;

  Future<void> _onCameraSelected() async {
    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;

    Navigator.of(context)
        .push<XFile?>(
      MaterialPageRoute(
        builder: (context) => TakePictureScreen(camera: firstCamera),
      ),
    )
        .then((value) {
      if (value != null) {
        widget.onImageSelected(value);
      }
    });
  }

  Future<void> _onPickImage(ImageSource source) async {
    if (_isPickingImage) return;
    _isPickingImage = true;
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
      source: source,
      maxHeight: widget.maxHeight,
      maxWidth: widget.maxWidth,
      imageQuality: widget.imageQuality,
      preferredCameraDevice: widget.preferredCameraDevice,
    );
    _isPickingImage = false;
    if (pickedFile != null) {
      PermissionStatus status = await Permission.photos.status;
      try {
        if (!status.isGranted) {
          status = await Permission.photos.request();
          if (!status.isGranted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text(
                      'Por favor, acepta el permiso para acceder a la galería.')),
            );
            widget.onImageSelected(pickedFile);
            return;
          } else {
            final String savedImagePath =
                await ImageSaver.saveImage(pickedFile);

            widget.onImageSelected(XFile(savedImagePath));
          }
        } else {
          final String savedImagePath = await ImageSaver.saveImage(pickedFile);
          widget.onImageSelected(XFile(savedImagePath));
        }
      } on PathExistsException catch (_) {
        widget.onImageSelected(pickedFile);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !_isPickingImage,
      child: Container(
        padding: widget.bottomSheetPadding,
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: widget.cameraIcon,
              title: widget.cameraLabel,
              onTap: () => _onCameraSelected(),
            ),
            ListTile(
              leading: widget.galleryIcon,
              title: widget.galleryLabel,
              onTap: () => _onPickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }
}
