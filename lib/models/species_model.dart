class SpeciesModel {
  final String id, name, classification, eyeColors, hairColors;

  SpeciesModel.fromJson(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        name = map['name'] ?? '',
        classification = map['classification'] ?? '',
        eyeColors = map['eye_colors'] ?? '',
        hairColors = map['hair_colors'] ?? '';
}
