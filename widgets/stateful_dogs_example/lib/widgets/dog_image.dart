import 'package:flutter/material.dart';

class DogImage extends StatefulWidget {
  const DogImage({super.key});

  final endpoint = 'https://dog.ceo/api/breeds/image/random';

  @override
  State<DogImage> createState() => _DogImageState();
}

class _DogImageState extends State<DogImage> {
  var _dogImageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text('IMAGE'), Text('BUTTON')]);
  }
}
