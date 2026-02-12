// Screen used to add places to the list
//to manage user i/p...so stf widget
import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

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
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: (){},
              label: const Text('Add Place'),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),

    );
  }
}
