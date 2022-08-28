import 'dart:convert';
import 'dart:io';
import 'package:cat_task/common/response_state.dart';
import 'package:cat_task/models/anime_model.dart';
import 'package:http/http.dart' as http;
import '../../../common/api_url.dart';

Future<ResponseState<List<AnimeModel>>> fetchAllAnime() async {
  const String uri = '$endpoint/films';
  var jsonData = await http.get(Uri.parse(uri));
  try {
    if (jsonData.statusCode == 200) {
      List allAnime = jsonDecode(jsonData.body);
      List<AnimeModel> animeModel = [];
      for (var anAnime in allAnime) {
        AnimeModel anime = AnimeModel.fromJson(anAnime);
        animeModel.add(anime);
      }

      return ResponseState(statusCode: jsonData.statusCode, data: animeModel);
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
