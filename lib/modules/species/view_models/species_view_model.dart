import 'package:cat_task/models/species_model.dart';
import 'package:cat_task/modules/species/repositories/species_repositories.dart';
import 'package:flutter/material.dart';

class SpeciesViewModel with ChangeNotifier {
  final List speciesUrl;
  final List<SpeciesModel> species = [];

  SpeciesViewModel({required this.speciesUrl});

  void getSpecies() {
    for (final url in speciesUrl) {
      SpeciesRepository.fetchSpecies(url).then((value) {
        species.addAll(value.data ?? []);
        notifyListeners();
      });
    }
  }
}
