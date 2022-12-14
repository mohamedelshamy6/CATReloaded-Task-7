import 'package:cat_task/modules/people/screens/person_screen.dart';
import 'package:cat_task/modules/people/view_models/people_view_model.dart';
import 'package:cat_task/modules/people/view_models/person_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PeopleViewModel>();
    final people = viewModel.people;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'People',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20.0),
        children: [
          for (final person in people)
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Provider(
                      child: const PersonScreen(),
                      create: (_) => PersonViewModel(person: person)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    person.name,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
