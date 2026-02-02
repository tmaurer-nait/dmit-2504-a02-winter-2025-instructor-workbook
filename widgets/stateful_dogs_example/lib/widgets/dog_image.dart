import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

      // Calls set state to trigger a redraw
      setState(() {
        // Updates the state variable
        _dogImageUrl = newImageUrl;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    loadDogImage();
  }

  // Helper method that is used to clean up the build method by extracting
  // some of the code to here
  Widget _buildImage() {
    return _dogImageUrl == ''
        ? SizedBox(
            height: 600,
            child: Center(child: CircularProgressIndicator()),
          )
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
            child: Image.network(_dogImageUrl, height: 600, fit: BoxFit.cover),
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
