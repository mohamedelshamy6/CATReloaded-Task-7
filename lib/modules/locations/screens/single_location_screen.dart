import 'package:cat_task/modules/locations/view_models/single_location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleLocationScreen extends StatelessWidget {
  const SingleLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SingleLocationViewModel>();
    final singleLocation = viewModel.location;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          singleLocation.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ID : ${singleLocation.id}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Name : ${singleLocation.name}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Climate : ${singleLocation.climate}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Surface water : ${singleLocation.surfaceWater}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Terrain : ${singleLocation.terrain}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
