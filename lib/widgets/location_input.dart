// to add it as an element to the add place screens


import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {

   Location? _pickedLocation;
   var _isGettingLocation = false;

  //method to get current location of the user
  void _getCurrentLocation() async {

    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();

    setState(() {
      _isGettingLocation = false;
    });

    print(locationData.latitude);
    print(locationData.longitude);


  }


  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      'No location chosen',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );

    if(_isGettingLocation) {
      previewContent =const CircularProgressIndicator();
    }

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
          child: previewContent,
    ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //one button to get user location automatically
          //second button to get loc manually
          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text('Get User Location'),
              onPressed: _getCurrentLocation,
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
