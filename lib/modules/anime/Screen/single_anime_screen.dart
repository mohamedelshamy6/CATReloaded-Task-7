import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_task/modules/anime/view_models/single_anime_view_model.dart';
import 'package:cat_task/modules/people/screens/people_screen.dart';
import 'package:cat_task/modules/people/view_models/people_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleAnimeScreen extends StatelessWidget {
  const SingleAnimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SingleAnimeViewModel>();
    final sAnime = viewModel.sAnime;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          sAnime.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: sAnime.banner,
              placeholder: (_, __) => const CircularProgressIndicator(
                strokeWidth: 3.0,
                color: Colors.black,
              ),
              errorWidget: (context, url, error) =>
                  const Center(child: Text('Error occurred')),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      sAnime.description,
                      style: const TextStyle(fontSize: 20, color: Colors.white70),
                    ),
                  ),
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: sAnime.image,
                      placeholder: (_, __) => const CircularProgressIndicator(
                        strokeWidth: 3.0,
                        color: Colors.black,
                      ),
                      errorWidget: (context, url, error) =>
                          const Center(child: Text('Error occurred')),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            customColumn(
                'People',
                context,
                Provider(
                    create: (_) => PeopleViewModel(peopleUrl: [sAnime.people])
                      ..getPeople(),
                    child: const PeopleScreen())),
            const SizedBox(height: 10.0),
            customColumn('Locations', context, const PeopleScreen()),
            const SizedBox(height: 10.0),
            customColumn('Species', context, const PeopleScreen()),
            const SizedBox(height: 10.0),
            customColumn('Vehicles', context, const PeopleScreen()),
          ],
        ),
      ),
    );
  }

  Column customColumn(String title, context, Widget screen) {
    return Column(
      children: [
        const Divider(
          color: Colors.white,
          thickness: 2,
        ),
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => screen,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        const Divider(
          color: Colors.white,
          thickness: 2,
        ),
      ],
    );
  }
}
