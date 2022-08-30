import 'package:cat_task/models/vehicles_model.dart';
import 'package:cat_task/modules/vehicles/repositories/vehicles_repositories.dart';
import 'package:flutter/material.dart';

class VehiclesViewModel with ChangeNotifier {
  final List vehiclesUrl;
  final List<VehicleModel> vehicle = [];

  VehiclesViewModel({required this.vehiclesUrl});

  void getVehicles() {
    for (final url in vehiclesUrl) {
      VehiclesRepository.fetchVehicles(url).then((value) {
        vehicle.addAll(value.data ?? []);
        notifyListeners();
      });
    }
  }
}
