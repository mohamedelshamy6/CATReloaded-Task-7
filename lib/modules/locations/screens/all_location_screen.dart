import 'package:cat_task/modules/locations/screens/single_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/all_locations_view_model.dart';
import '../view_models/single_location_view_model.dart';

class AllLocationScreen extends StatelessWidget {
  const AllLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LocationViewModel>();
    final location = viewModel.locations;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Locations',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20.0),
        children: [
          for (final sLocation in location)
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Provider(
                      child: const SingleLocationScreen(),
                      create: (_) =>
                          SingleLocationViewModel(location: sLocation)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    sLocation.name,
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
