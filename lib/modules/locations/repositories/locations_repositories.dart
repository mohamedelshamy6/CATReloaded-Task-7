import 'dart:convert';
import 'dart:io';
import 'package:cat_task/models/locations_model.dart';
import '../../../common/response_state.dart';
import 'package:http/http.dart' as http;

class LocationsRepository {
  static Future<ResponseState<List<LocationModel>>> fetchLocations(
    String url,
  ) async {
    var jsonData = await http.get(Uri.parse(url));
    try {
      if (jsonData.statusCode == 200) {
        final data = jsonDecode(jsonData.body);
        if (data is Map<String, dynamic>) {
          final location = LocationModel.fromJson(data);
          return ResponseState(
              statusCode: jsonData.statusCode, data: [location]);
        } else {
          List<LocationModel> locationModel = [];
          for (var location in data) {
            LocationModel sLocation = LocationModel.fromJson(location);
            locationModel.add(sLocation);
          }
          return ResponseState(
              statusCode: jsonData.statusCode, data: locationModel);
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
