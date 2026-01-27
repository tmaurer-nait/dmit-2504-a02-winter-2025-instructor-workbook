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
  var _dogImageUrl = '';

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
