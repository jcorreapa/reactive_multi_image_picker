import 'dart:io';

import 'package:example/image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_multi_image_picker/reactive_multi_image_picker.dart';
import 'package:provider/provider.dart';

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

class MyForm{
  final imagesControl = fb.control<List<AppImage>>(
                  [AppImage.remote("https://i.imgur.com/fkVpmGE.jpeg")],
                  [Validators.maxLength(2)]);
  final imageControl = fb.control<AppImage?>(null, [Validators.required]);
  late final control = fb.group({"images": imagesControl, "image": imageControl});
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
          child: Provider(
            create: (_) => MyForm(),
            builder: (context, _) {
              final myForm = Provider.of<MyForm>(context);
              return ReactiveForm(
                formGroup: myForm.control,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ReactiveMultiImagePicker<AppImage, AppImage>(
                        formControl: myForm.imagesControl,
                        //valueAccessor: FileValueAccessor(),
                        decoration: const InputDecoration(labelText: 'Pick photos'),
                        imageBuilder: (image) => image.when(
                          remote: (url) => Image.network(url),
                          mobile: (xfile) => Image.file(File(xfile.path)),
                          web: (xfile) => Image.network(xfile.path),
                        ),
                        xFileConverter: (file) =>
                            kIsWeb ? AppImage.web(file) : AppImage.mobile(file),
                      ),
                      ReactiveImagePicker<AppImage?, AppImage>(
                        formControl: myForm.imageControl,
   
                        decoration:
                            const InputDecoration(labelText: 'Pick one photo'),
                        imageBuilder: (image) => image.when(
                          remote: (url) => Image.network(url),
                          mobile: (xfile) => Image.file(File(xfile.path)),
                          web: (xfile) => Image.network(xfile.path),
                        ),
                        xFileConverter: (file) =>
                            kIsWeb ? AppImage.web(file) : AppImage.mobile(file),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                          child: Text('Submit'),
                          onPressed: () async {
                            if (myForm.control.valid) {
                              print(myForm.control.value);
                            }
                          }),
                    ],
                  )
                
              );
            }
          ),
        ),
      ),
    );
  }
}
/*
class FileValueAccessor extends ControlValueAccessor<List<String>, List<File>> {
  @override
  modelToViewValue(paths) {
    return paths.map((path) => File(path)).toList();
  }

  @override
  viewToModelValue(files) {
    return files.map((file) => file.path).toList();
  }
}*/
