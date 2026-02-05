import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // If you put an appBar on your page and utilize routing, it will
      // automatically include a back button for you
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('PAGE TWO'),
            FilledButton(
              onPressed: () {
                // To return to page one from page two we just pop() the stack
                // This is effectively a back button
                Navigator.of(context).pop<String>('You left Page Two');
              },
              child: Text('Go Back To Page One'),
            ),
          ],
        ),
      ),
    );
  }
}
