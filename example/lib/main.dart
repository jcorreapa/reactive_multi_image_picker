import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_multi_image_picker/reactive_multi_image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReactiveMultiImagePicker Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ReactiveFormBuilder(
            form: () => fb.group({"images": fb.control<List<String>>([])}),
            builder: (context, form, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ReactiveMultiImagePicker<String, File>(
                    formControlName: 'images',
                    valueAccessor: FileValueAccessor(),
                    decoration: const InputDecoration(labelText: 'Pick Photos'),
                    maxImages: 3,
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                      child: Text('Submit'),
                      onPressed: () async {
                        if (form.valid) {
                          print(form.value);
                        }
                      }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class FileValueAccessor extends ControlValueAccessor<List<String>, List<File>> {
  @override
  modelToViewValue(paths) {
    return paths.map((path) => File(path)).toList();
  }

  @override
  viewToModelValue(files) {
    return files.map((file) => file.path).toList();
  }
}
