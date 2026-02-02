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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _dogImageUrl == ''
            ? CircularProgressIndicator()
            : Image.network(_dogImageUrl, height: 600),
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
            loadDogImage();
          },
          child: Text('Fetch a New Dog'),
        ),
      ],
    );
  }
}
