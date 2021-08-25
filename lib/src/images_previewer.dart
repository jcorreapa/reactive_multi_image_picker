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

  const ImagesPreviewer({
    Key? key,
    this.previewWidth = 130,
    this.previewHeight = 130,
    this.previewMargin,
    this.deleteImageBuilder,
    this.addImageWidget,
    required this.items,
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
              assert(item is File || item is String || item is Uint8List);
              return Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  Container(
                    width: previewWidth,
                    height: previewHeight,
                    margin: previewMargin,
                    child: FullScreenViewer(
                      child: kIsWeb
                          ? Image.memory(item as Uint8List, fit: BoxFit.cover)
                          : item is String
                              ? Image.network(item, fit: BoxFit.cover)
                              : Image.file(item as File, fit: BoxFit.cover),
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
}
