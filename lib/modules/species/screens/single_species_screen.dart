import 'package:cat_task/modules/species/view_models/single_species_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleSpeciesScreen extends StatelessWidget {
  const SingleSpeciesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SingleSpeciesViewModel>();
    final singleSpecies = viewModel.species;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          singleSpecies.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ID : ${singleSpecies.id}',
              softWrap: true,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Name : ${singleSpecies.name}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Classification : ${singleSpecies.classification}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Hair colors : ${singleSpecies.hairColors}',
              textAlign: TextAlign.center,
              softWrap: true,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Eye colors : ${singleSpecies.eyeColors}',
              textAlign: TextAlign.center,
              softWrap: true,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
