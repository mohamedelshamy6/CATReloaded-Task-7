import 'package:cat_task/modules/anime/repositories/anime_repository.dart';
import 'package:flutter/material.dart';
import '../../../common/response_state.dart';
import '../../../models/anime_model.dart';

class AnimeViewModel with ChangeNotifier {
  ResponseState<List<AnimeModel>>? anime;

  Future<ResponseState<List<AnimeModel>>?> getAllAnime() async {
    anime = await fetchAllAnime();

    notifyListeners();
    return anime;
  }
}
