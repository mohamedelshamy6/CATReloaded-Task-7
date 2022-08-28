import 'package:cat_task/models/people_model.dart';
import 'package:cat_task/modules/people/repositories/people_repositories.dart';
import 'package:flutter/material.dart';

class PeopleViewModel with ChangeNotifier {
  final List peopleUrl;
  final List<PeopleModel> people = [];

  PeopleViewModel({required this.peopleUrl});

  void getPeople() {
    for (final url in peopleUrl) {
      PeopleRepository.fetchPeople(url).then((value) {
        people.addAll(value.data ?? []);
        notifyListeners();
      });
    }
  }
}
