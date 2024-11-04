import 'package:flutter/material.dart';
import 'package:flutter_spotify/API/api_request.dart';
import 'package:flutter_spotify/API/models/songModel.dart';
import 'package:flutter_spotify/SCREENS/AlbumTracks.dart';
import 'package:flutter_spotify/SCREENS/Home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home_Screen(),
    );
  }
}
