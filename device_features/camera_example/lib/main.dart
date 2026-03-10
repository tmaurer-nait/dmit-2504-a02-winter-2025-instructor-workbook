import 'package:camera_example/pages/camera_page.dart';
import 'package:flutter/material.dart';

import 'package:camera/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ask the device what cameras can I use?
  List<CameraDescription> cameras = await availableCameras();

  runApp(MainApp(availableCameras: cameras));
}

class MainApp extends StatelessWidget {
  const MainApp({required this.availableCameras, super.key});

  final List<CameraDescription> availableCameras;

  @override
  Widget build(BuildContext context) {
    // Pass in the first camera to the camera page to use for preview and pictures
    return MaterialApp(home: CameraPage(camDescription: availableCameras[0]));
  }
}
