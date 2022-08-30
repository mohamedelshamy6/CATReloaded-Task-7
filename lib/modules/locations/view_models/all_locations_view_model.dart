import 'package:flutter/material.dart';
import '../../../modules/locations/repositories/locations_repositories.dart';
import '../../../models/locations_model.dart';

class LocationViewModel with ChangeNotifier {
  final List locationUrl;
  final List<LocationModel> locations = [];

  LocationViewModel({required this.locationUrl});

  void getLocations() {
    for (final url in locationUrl) {
      LocationsRepository.fetchLocations(url).then((value) {
        locations.addAll(value.data ?? []);
        notifyListeners();
      });
    }
  }
}
