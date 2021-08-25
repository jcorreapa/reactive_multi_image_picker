# reactive_multi_image_picker

Fork form_builder_image_picker Field for picking image(s) from Gallery or Camera for reactive_forms package

## Usage
```dart
control = fb.control<List<File>>([]);
FormBuilderImagePicker(
            formControl: control,
            decoration: const InputDecoration(
              labelText: 'photos',
            ),
          )
```
