class PeopleModel {
  final String id, name, age, eyeColor, hairColor,gender;

  PeopleModel.fromJson(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        name = map['name'] ?? '',
        age = map['age'] ?? '',
        eyeColor = map['eye_color'] ?? '',
        hairColor = map['hair_color'] ?? '',
        gender = map['gender'] ?? 'male';
}