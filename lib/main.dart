import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:major_project/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Fetch the available cameras before initializing the app.
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatefulWidget {
  final CameraDescription camera;

  const MyApp({
    Key? key,
    required this.camera,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    super.widget.camera;
    return MaterialApp(
      home: Scaffold(
        // body: SafeArea(child: TabScreens[index]),
        body: getTabScreens(index: index, camera: widget.camera),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: GNav(
            selectedIndex: index,
            onTabChange: (value) => setState(() {
              index = value;
            }),
            rippleColor:
                Colors.grey[800]!, // tab button ripple color when pressed
            hoverColor: Colors.grey[700]!, // tab button hover color
            haptic: true, // haptic feedback
            gap: 8,
            activeColor: const Color.fromARGB(255, 171, 134, 241),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            tabs: const [
              GButton(icon: Icons.home_outlined, text: "Home"),
              GButton(icon: Icons.camera_alt_outlined, text: "Camera"),
              GButton(icon: Icons.mic_none, text: "Audio"),
              GButton(icon: Icons.translate_rounded, text: "Translater"),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
