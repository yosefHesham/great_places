import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:places/helpers/db_helper.dart';
import 'package:places/model/place.dart';

class GreatPlacesProvider with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }

  void addPlace(
    String title,
    File image,
  ) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        image: image,
        title: title,
        location: null);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map((place) => Place(
            location: null,
            id: place['id'],
            title: place['title'],
            image: File(place['image'])))
        .toList();
  }
}
