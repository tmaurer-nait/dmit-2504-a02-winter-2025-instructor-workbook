import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dart:io';
// flutter pub add path_provider
import 'package:path_provider/path_provider.dart';

class DogImage extends StatefulWidget {
  const DogImage({super.key});

  final endpoint = 'https://dog.ceo/api/breeds/image/random';

  @override
  State<DogImage> createState() => _DogImageState();
}

class _DogImageState extends State<DogImage> {
  // Stateful variables
  var _dogImageUrl = '';
  var _likes = 0;
  var _dislikes = 0;

  // Helper function to get a dog image URL - should be moved to API file
  Future<String> getRandomDogImage() async {
    // Parse the URI
    final uri = Uri.parse(widget.endpoint);

    // Make the request and await the response
    final res = await http.get(uri);

    // Decode the JSON and return the necessary info
    return jsonDecode(res.body)['message'];
  }

  void loadDogImage() {
    // empty url to force circular progress indicator
    setState(() {
      _dogImageUrl = '';
    });
    // fetches a new dog image url
    getRandomDogImage().then((newImageUrl) {
      // Do a mounted check because we are setting state in
      // response to async call
      if (!mounted) return;

      // When we load a new image save it to the cache file
      _saveImage(newImageUrl);

      // Calls set state to trigger a redraw
      setState(() {
        // Updates the state variable
        _dogImageUrl = newImageUrl;
      });
    });
  }

  // This function takes in an image url, fetches the data from that url
  // and saves that data (image data) to a file

  void _saveImage(String url) async {
    // fetch the image and await the response
    final res = await http.get(Uri.parse(url));

    // get the temp directory (we chose temporary because the file is not super important)
    final dir = await getTemporaryDirectory();

    // set up the file path
    final filePath = '${dir.path}/cachedDog.jpg';

    // open the file
    final file = File(filePath);

    // write the image data to the file
    file.writeAsBytesSync(res.bodyBytes);
  }

  @override
  void initState() {
    super.initState();

    // Get the temp directory
    getTemporaryDirectory().then((dir) {
      // If the cache file exists, load it into the state
      final file = File('${dir.path}/cachedDog.jpg');

      if (file.existsSync()) {
        setState(() {
          _dogImageUrl = '${dir.path}/cachedDog.jpg';
        });
      } else {
        // Else get a new dog
        loadDogImage();
      }
    });
  }

  // Helper method that is used to clean up the build method by extracting
  // some of the code to here
  Widget _buildImage() {
    // We now need to check on the state of the image. There are 3 cases:
    // 1. Empty Image URL -> show loading spinner
    // 2. Image is available online -> Image.network
    // 3. Image is cached locally -> Image.file

    // This variable will store the reference to whatever needs to be shown
    late Widget childWidget;

    if (_dogImageUrl.trim().isEmpty) {
      // Case 1
      childWidget = CircularProgressIndicator();
    } else if (_dogImageUrl.startsWith('http')) {
      // Case 2
      childWidget = Image.network(_dogImageUrl, height: 600, fit: BoxFit.cover);
    } else {
      // Case 3
      childWidget = Image.file(
        File(_dogImageUrl),
        height: 600,
        fit: BoxFit.cover,
      );
    }

    return _dogImageUrl == ''
        ? SizedBox(height: 600, child: Center(child: childWidget))
        : GestureDetector(
            onDoubleTap: () {
              setState(() {
                _likes++;
              });
              loadDogImage();
            },
            onLongPress: () {
              setState(() {
                _dislikes++;
              });
              loadDogImage();
            },
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity != null &&
                  details.primaryVelocity! > 0) {
                setState(() {
                  _likes++;
                });
                loadDogImage();
              } else {
                setState(() {
                  _dislikes++;
                });
                loadDogImage();
              }
            },
            child: childWidget,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildImage(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Likes: $_likes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Dislikes: $_dislikes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _likes++;
            });
            loadDogImage();
          },
          child: Text('Like'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _dislikes++;
            });
            loadDogImage();
          },
          child: Text('Dislike'),
        ),
      ],
    );
  }
}
