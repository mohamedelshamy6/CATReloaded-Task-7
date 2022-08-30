import 'package:cat_task/modules/vehicles/screens/single_vehicle_screen.dart';
import 'package:cat_task/modules/vehicles/view_models/single_vehicle_view_model.dart';
import 'package:cat_task/modules/vehicles/view_models/vehicles_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<VehiclesViewModel>();
    final vehicles = viewModel.vehicle;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vehicles',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20.0),
        children: [
          for (final vehicle in vehicles)
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Provider(
                      child: const SingleVehicleScreen(),
                      create: (_) => SingleVehicleViewModel(vehicle: vehicle)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    vehicle.name,
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
