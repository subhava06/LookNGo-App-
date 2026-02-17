// to add it as an element to the add place screens


import 'package:flutter/cupertino.dart';

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

        ),

        Row(
          //one button to get user location automatically
          //second button to get loc manually
        ),
      ],
    );
  }
}
