import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('PAGE ONE'),
            ElevatedButton(onPressed: () {}, child: Text('')),
            Text('DATA FROM PAGE TWO GOES HERE'),
          ],
        ),
      ),
    );
  }
}
