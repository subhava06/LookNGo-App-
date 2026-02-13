// Screen used to add places to the list
//to manage user i/p...so stf widget
import 'package:favorite_places_app/users/user_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();

  void _savePlace() {
    final enteredTitle = _titleController.text;
    if(enteredTitle.isEmpty) {
      return;
    }

    ref.read(userPlacesProvider.notifier).addPlace(enteredTitle);

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

            // image input

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
