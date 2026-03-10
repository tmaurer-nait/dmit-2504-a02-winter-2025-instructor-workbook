import 'package:flutter/material.dart';

// flutter pub add camera
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({required this.camDescription, super.key});

  final CameraDescription camDescription;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Route to gallery page
            },
            icon: Icon(Icons.photo),
          ),
        ],
      ),
      body: Center(
        // TODO: Camera Preview
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: take a picture
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
