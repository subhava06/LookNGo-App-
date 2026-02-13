// code to:
// allow user to open device camera
// show a preview of the image that was taken
//ans also pass that image back to the add place screen to add it to the list

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';'

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

  void _takePicture() {
     final imagePicker = ImagePicker();
     imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600, );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            width: 3,
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2)),
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center, //centres the child horz and vert inside the container
      child: TextButton.icon(
        icon: const Icon(Icons.camera),
        label: const Text('Take Picture'),
          onPressed: _takePicture,
      ), // it should either be a preview of the image or a button that allows us to take image
    );
  }
}
