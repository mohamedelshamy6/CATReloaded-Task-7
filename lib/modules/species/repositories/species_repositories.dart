import 'dart:convert';
import 'dart:io';
import 'package:cat_task/models/species_model.dart';
import '../../../common/response_state.dart';
import 'package:http/http.dart' as http;

class SpeciesRepository {
  static Future<ResponseState<List<SpeciesModel>>> fetchSpecies(
    String url,
  ) async {
    var jsonData = await http.get(Uri.parse(url));
    try {
      if (jsonData.statusCode == 200) {
        final data = jsonDecode(jsonData.body);
        if (data is Map<String, dynamic>) {
          final species = SpeciesModel.fromJson(data);
          return ResponseState(
              statusCode: jsonData.statusCode, data: [species]);
        } else {
          List<SpeciesModel> speciesModel = [];
          for (var species in data) {
            SpeciesModel singleSpecies = SpeciesModel.fromJson(species);
            speciesModel.add(singleSpecies);
          }
          return ResponseState(
              statusCode: jsonData.statusCode, data: speciesModel);
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
