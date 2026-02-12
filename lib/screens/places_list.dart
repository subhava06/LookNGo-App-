// shows list of places

import 'package:flutter/material.dart';

class PlacesListScreen extends StatelessWidget {
     const PlacesListScreen({super.key});

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(
           title: const Text('Your Places'),
           actions: [
             IconButton(
               icon: const Icon(Icons.add),
               onPressed: () {},
             ),
           ],
         ),
         body: const Center(
           child: Text('No places added yet.'),

         ),
       );
     }
}