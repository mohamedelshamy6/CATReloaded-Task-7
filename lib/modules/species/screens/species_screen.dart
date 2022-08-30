import 'package:cat_task/modules/species/screens/single_species_screen.dart';
import 'package:cat_task/modules/species/view_models/single_species_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/species_view_model.dart';

class SpeciesScreen extends StatelessWidget {
  const SpeciesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SpeciesViewModel>();
    final species = viewModel.species;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Species',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20.0),
        children: [
          for (final species in species)
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Provider(
                      child: const SingleSpeciesScreen(),
                      create: (_) => SingleSpeciesViewModel(species: species)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    species.name,
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
