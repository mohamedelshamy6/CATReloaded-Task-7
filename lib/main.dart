import 'package:cat_task/modules/anime/Screen/all_anime_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:  AppBarTheme(color: Colors.teal[400]),
        scaffoldBackgroundColor: Colors.blueGrey,
      ),
      home: const AllAnimeScreen(),
    );
  }
}
