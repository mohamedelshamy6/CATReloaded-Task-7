import 'package:cat_task/modules/vehicles/view_models/single_vehicle_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleVehicleScreen extends StatelessWidget {
  const SingleVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SingleVehicleViewModel>();
    final vehicle = viewModel.vehicle;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          vehicle.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ID : ${vehicle.id}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Name : ${vehicle.name}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Description : ${vehicle.description}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Vehicle class : ${vehicle.vehicleClass}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Length : ${vehicle.length}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
