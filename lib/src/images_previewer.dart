import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'full_screen_viewer.dart';

class ImagesPreviewer<ViewDataType> extends StatelessWidget {
  final double previewWidth;
  final double previewHeight;
  final EdgeInsets? previewMargin;
  final Widget Function(BuildContext context, ViewDataType item)?
      deleteImageBuilder;
  final Widget? addImageWidget;
  final Iterable<ViewDataType>? items;
  final Widget Function(ViewDataType item)? imageBuilder;

  const ImagesPreviewer({
    Key? key,
    this.previewWidth = 130,
    this.previewHeight = 130,
    this.previewMargin,
    this.deleteImageBuilder,
    this.addImageWidget,
    required this.items,
    this.imageBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: previewHeight,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          if (items != null)
            ...items!.map<Widget>((item) {
              return Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  Container(
                    width: previewWidth,
                    height: previewHeight,
                    margin: previewMargin,
                    child: FullScreenViewer(
                      child: imageBuilder != null
                          ? imageBuilder!(item)
                          : _defaultImageBuilder(item),
                    ),
                  ),
                  if (deleteImageBuilder != null)
                    deleteImageBuilder!(context, item),
                ],
              );
            }),
          if (addImageWidget != null) addImageWidget!,
        ],
      ),
    );
  }

  Widget _defaultImageBuilder(ViewDataType item) {
    return kIsWeb
        ? Image.network(item as String, fit: BoxFit.cover)
        : item is String
            ? Image.network(item, fit: BoxFit.cover)
            : Image.file(item as File, fit: BoxFit.cover);
  }
}
