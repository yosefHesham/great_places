import 'package:flutter/cupertino.dart';
import 'package:places/model/place.dart';

class GreatPlacesProvider with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }
}
