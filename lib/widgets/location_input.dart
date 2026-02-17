// to add it as an element to the add place screens


import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        //container to show preview of the image
        Container(
            alignment: Alignment.center,
            height: 170,
            width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
                width: 3,
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2)),
          ),
          // to get snapshot of the selected image
          child: Text(
            'No location chosen',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),),
    ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //one button to get user location automatically
          //second button to get loc manually
          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text('Get User Location'),
              onPressed: () {},
            ),

            TextButton.icon(
              icon: const Icon(Icons.map),
              label: const Text('Select on map'),
              onPressed: () {},
            ),
          ],
        ),

      ],
    );
  }
}
