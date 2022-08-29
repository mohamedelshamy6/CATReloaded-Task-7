import 'package:cat_task/modules/people/view_models/people_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read()<PeopleViewModel>();
    final people = viewModel.people;
    return Scaffold(
      body: ListView(
        children: [
          for (final person in people)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: Text(person.eyeColor)),
            )
        ],
      ),
    );
  }
}
