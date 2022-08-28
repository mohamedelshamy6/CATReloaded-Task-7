class VehicleModel {
  final String id, name, description, vehicleClass, length;

  VehicleModel.fromJson(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        name = map['name'] ?? '',
        description = map['description'] ?? '',
        vehicleClass = map['vehicle_class'] ?? '',
        length = map['length'] ?? '';
}
