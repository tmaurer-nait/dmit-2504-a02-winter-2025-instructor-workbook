import 'package:camera_example/pages/gallery_page.dart';
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
  late CameraController _cameraController;

  @override
  void initState() {
    super.initState();

    // Create a new camera controller for the correct camera
    _cameraController = CameraController(
      widget.camDescription,
      ResolutionPreset.max,
    );

    // Initialize camera controller, getting permissions as needed
    _cameraController
        .initialize()
        .then((_) {
          // Camera permission granted, no errors
          setState(() {
            // This is a empty set state, only here to force a rebuild
            // If we wanted to we could set up our camera presets here
          });
        })
        .catchError((e) {
          // Error happened check if no permissions and handle as needed
          if (e is CameraException && e.code == "CameraAccessDenied") {
            // If user doesn't give permissions here's where you handle that
            // You could re-ask, show error UI, close app, etc.
            throw Exception('Camera Permission Denied');
          }
        });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<XFile?> _takePicture() async {
    // first make sure no picture is already being taken
    if (_cameraController.value.isTakingPicture) return null;

    // take the picture
    try {
      // By default taking a picture stores that file in your local cache folder
      // Later on we could move it, or we could just accept and read from there
      // whenever needed
      final file = await _cameraController.takePicture();
      return file;
    } catch (e) {
      // Here's where I handle something going wrong with the picture taking
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => GalleryPage()));
            },
            icon: Icon(Icons.photo),
          ),
        ],
      ),
      body: Center(child: CameraPreview(_cameraController)),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var file = await _takePicture();

          if (file != null && mounted) {
            // Show some feedback that the photo was successfully taken
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Picture saved to: ${file.path}')),
            );
          }
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
