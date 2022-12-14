import 'dart:convert';
import 'dart:io';
import 'package:cat_task/models/people_model.dart';
import '../../../common/response_state.dart';
import 'package:http/http.dart' as http;

class PeopleRepository {
  static Future<ResponseState<List<PersonModel>>> fetchPeople(
    String url,
  ) async {
    var jsonData = await http.get(Uri.parse(url));
    try {
      if (jsonData.statusCode == 200) {
        final data = jsonDecode(jsonData.body);
        if (data is Map<String, dynamic>) {
          final person = PersonModel.fromJson(data);
          return ResponseState(statusCode: jsonData.statusCode, data: [person]);
        } else {
          List<PersonModel> personModel = [];
          for (var person in data) {
            PersonModel sPerson = PersonModel.fromJson(person);
            personModel.add(sPerson);
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
