import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_task/common/response_state.dart';
import 'package:cat_task/modules/anime/Screen/single_anime_screen.dart';
import 'package:cat_task/modules/anime/view_models/anime_view_model.dart';
import 'package:cat_task/modules/anime/view_models/single_anime_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/anime_model.dart';
import '../view_models/anime_view_model.dart';

class AllAnimeScreen extends StatelessWidget {
  const AllAnimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Anime',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => AnimeViewModel()
          ..getAllAnime().then((value) {
            if (value.statusCode != 200) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: value.message));
            }
          }),
        builder: (context, child) {
          final viewModel = context.watch<AnimeViewModel>();
          final allAnime = viewModel.anime;
          return myBody(allAnime!);
        },
      ),
    );
  }

  FutureBuilder<ResponseState<List<AnimeModel>>> myBody(
      Future<ResponseState<List<AnimeModel>>> allAnime) {
    return FutureBuilder<ResponseState<List<AnimeModel>>>(
        future: allAnime,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Provider(
                          child: const SingleAnimeScreen(),
                          create: (_) => SingleAnimeViewModel(
                              sAnime: snapshot.data!.data![index])),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15.0),
                    padding: const EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0)),
                          child: CachedNetworkImage(
                            imageUrl: snapshot.data!.data![index].banner,
                            placeholder: (_, __) =>
                                const CircularProgressIndicator(
                              strokeWidth: 3.0,
                              color: Colors.black,
                            ),
                            errorWidget: (context, url, error) =>
                                const Center(child: Text('Error occurred')),
                          ),
                        ),
                        Text(
                          '${snapshot.data!.data![index].title}\n ${snapshot.data!.data![index].japaneseTitle}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          snapshot.data!.data![index].description,
                          textAlign: TextAlign.center,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: snapshot.data!.data?.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 6.0,
              ),
            );
          }
        });
  }
}
