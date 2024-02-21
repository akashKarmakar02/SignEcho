import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:major_project/screens/audio_screen.dart';
import 'package:major_project/screens/camera_screen.dart';
import 'package:major_project/screens/home.dart';

Widget getTabScreens({required int index, required CameraDescription camera}) {
  final TabScreens = [
    const SafeArea(child: HomeScreen()),
    CameraScreen(camera: camera),
    const AudioScreen(),
    const Text("Translater"),
  ];

  return TabScreens[index];
}

const countryList = [
  "eg",
  "in",
  "af",
  "de",
  "gb",
  "ru",
];
