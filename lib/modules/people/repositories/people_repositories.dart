import 'dart:convert';
import 'dart:io';
import 'package:cat_task/models/people_model.dart';
import '../../../common/api_url.dart';
import '../../../common/response_state.dart';
import 'package:http/http.dart' as http;

class PeopleRepository {
 static Future<ResponseState<List<PeopleModel>>> fetchPeople(String url) async {
    const String uri = '$endpoint/films';
    var jsonData = await http.get(Uri.parse(uri));
    try {
      if (jsonData.statusCode == 200) {
        final data = jsonDecode(jsonData.body);
        if (data is Map<String, dynamic>) {
          final person = PeopleModel.fromJson(data);
          return ResponseState(statusCode: jsonData.statusCode, data: [person]);
        } else {
          List<PeopleModel> personModel = [];
          for (var anAnime in data) {
            PeopleModel anime = PeopleModel.fromJson(anAnime);
            personModel.add(anime);
          }
          return ResponseState(
              statusCode: jsonData.statusCode, data: personModel);
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
