


import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Pick_image{
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        return _image;
        // return await uploadFile();
      } else {
        print('No image selected.');
      }
  }
}