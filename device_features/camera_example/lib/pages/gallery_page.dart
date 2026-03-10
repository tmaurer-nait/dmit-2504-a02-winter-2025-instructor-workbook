import 'package:flutter/material.dart';

import 'dart:io';
import 'package:path_provider/path_provider.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<String> _photoPaths = [];

  @override
  void initState() {
    // Get the cache directory
    getApplicationCacheDirectory().then((dir) {
      setState(() {
        // Then get all files in that directory
        final fileList = dir.listSync().toList();

        for (var file in fileList) {
          // add that file's path to the state variable
          // For each file make sure it's a photo and if yes
          if (file.path.endsWith('jpg')) _photoPaths.add(file.path);
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, idx) {
          final photoPath = _photoPaths[idx];
          return ListTile(
            leading: Image.file(File(photoPath), height: 50, width: 50),
            title: Text(photoPath),
          );
        },
        itemCount: _photoPaths.length,
      ),
    );
  }
}
