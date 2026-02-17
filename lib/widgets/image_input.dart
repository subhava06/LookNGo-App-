// code to:
// allow user to open device camera
// show a preview of the image that was taken
//ans also pass that image back to the add place screen to add it to the list

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickImage});

  final void Function(File image) onPickImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

  // to show preview of image
   File? _selectedImage;

  void _takePicture() async{
     final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600, );

    if(pickedImage== null) {
      return;
    }

    setState(() {
      _selectedImage = File(pickedImage.path);

    });

    widget.onPickImage(_selectedImage!);
  }


  @override
  Widget build(BuildContext context) {

    Widget content = TextButton.icon(
      icon: const Icon(Icons.camera),
      label: const Text('Take Picture'),
      onPressed: _takePicture,
    );


    if(_selectedImage != null) {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }


    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            width: 3,
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2)),
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center, //centres the child horz and vert inside the container
      child: content,// it should either be a preview of the image or a button that allows us to take image
    );
  }
}
