import 'package:cat_task/modules/anime/repositories/anime_repository.dart';
import 'package:flutter/material.dart';
import '../../../common/response_state.dart';
import '../../../models/anime_model.dart';

class AnimeViewModel with ChangeNotifier {
  Future<ResponseState<List<AnimeModel>>>? anime;

  Future getAllAnime() async {
    anime =  fetchAllAnime() ;

    notifyListeners();
    return anime;
  }
}
