// Screen used to add places to the list
//to manage user i/p...so stf widget
import 'package:favorite_places_app/users/user_places.dart';
import 'package:favorite_places_app/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

import '../widgets/image_input.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  void _savePlace() {
    final enteredTitle = _titleController.text;
    if(enteredTitle.isEmpty || _selectedImage == null) {
      return;
    }

    ref.read(userPlacesProvider.notifier).addPlace(enteredTitle, _selectedImage!);

    Navigator.of(context).pop();

  }

  @override //always dispose controller inside stf widget
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  //since it is a separate standalone screen, so we need scaffold
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Place'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Title'),
              style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.onSurface),
              controller: _titleController,
            ),
            const SizedBox(height: 10,),
            // image input
            ImageInput(onPickImage: (image) {
              _selectedImage = image;
            },
            ),

            const SizedBox(height: 10,),
            LocationInput(),

            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _savePlace,
              label: const Text('Add Place'),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),

    );
  }
}
