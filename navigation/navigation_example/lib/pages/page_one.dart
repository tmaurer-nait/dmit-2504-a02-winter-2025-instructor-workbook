import 'package:flutter/material.dart';
import 'package:navigation_example/pages/page_two.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('PAGE ONE'),
            ElevatedButton(
              onPressed: () {
                // When I press this button I want to go to page two
                // I'll start with the material page route manual push
                // (though it's better to use pushNamed with centralized routing)
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => PageTwo()));
              },
              child: Text('Go To Page Two'),
            ),
            Text('DATA FROM PAGE TWO GOES HERE'),
          ],
        ),
      ),
    );
  }
}
