// manage places selected and added by the user

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places_app/models/place.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
    UserPlacesNotifier() : super(const []);

    void addPlace(String title) { //method to update the state
      final newPlace = Place(title: title);
      state = [newPlace, ...state];

    }
}

  final userPlacesProvider = StateNotifierProvider<UserPlacesNotifier,List<Place>>(
          (ref) => UserPlacesNotifier(),
  );