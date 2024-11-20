import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

abstract class ImageSaver {
  static Future<String> saveImage(XFile image) async {
    // Get the directory for the DCIM folder
    final Directory? dcimDir =
        Directory('/storage/emulated/0/DCIM/Inventarios');
    if (dcimDir == null) {
      throw Exception("Failed to get the DCIM directory.");
    }

    // Ensure the DCIM directory exists
    if (!await dcimDir.exists()) {
      await dcimDir.create(recursive: true);
    }

    // Generate a unique file name
    final String fileName = image.name;

    // Create the file path
    final String filePath = path.join(dcimDir.path, fileName);

    // Copy the file to the DCIM path
    final File newImage = await File(image.path).copy(filePath);

    return newImage.path;
  }
}
