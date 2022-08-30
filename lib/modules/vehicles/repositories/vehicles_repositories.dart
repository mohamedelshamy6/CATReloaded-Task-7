import 'dart:convert';
import 'dart:io';
import 'package:cat_task/models/vehicles_model.dart';
import '../../../common/response_state.dart';
import 'package:http/http.dart' as http;

class VehiclesRepository {
  static Future<ResponseState<List<VehicleModel>>> fetchVehicles(
    String url,
  ) async {
    var jsonData = await http.get(Uri.parse(url));
    try {
      if (jsonData.statusCode == 200) {
        final data = jsonDecode(jsonData.body);
        if (data is Map<String, dynamic>) {
          final vehicle = VehicleModel.fromJson(data);
          return ResponseState(
              statusCode: jsonData.statusCode, data: [vehicle]);
        } else {
          List<VehicleModel> vehicleModel = [];
          for (var vehicle in data) {
            VehicleModel sVehicle = VehicleModel.fromJson(vehicle);
            vehicleModel.add(sVehicle);
          }
          return ResponseState(
              statusCode: jsonData.statusCode, data: vehicleModel);
        }
      } else {
        return ResponseState.error();
      }
    } catch (e) {
      if (e is SocketException) {
        return ResponseState.networkError();
      }
      return ResponseState.error();
    }
  }
}
