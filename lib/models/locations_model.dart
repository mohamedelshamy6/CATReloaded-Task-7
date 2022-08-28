class LocationModel {
  final String id, name, climate, terrain, surfaceWater;

  LocationModel.fromJson(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        name = map['name'] ?? '',
        climate = map['climate'] ?? '',
        terrain = map['terrain'] ?? '',
        surfaceWater = map['surface_water'] ?? '';
}
