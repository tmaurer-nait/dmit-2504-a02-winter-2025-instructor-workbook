import 'package:flutter/material.dart';
import 'package:navigation_example/constants/routes.dart' as routes;

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  // Use this to display the return value from page two
  var data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('PAGE ONE'),
            ElevatedButton(
              // We made this async so we can "listen" for a response from page two
              // Navigator.push() resolves when the page it pushes is popped from the stack
              onPressed: () async {
                // When I press this button I want to go to page two
                // I'll start with the material page route manual push
                // (though it's better to use pushNamed with centralized routing)
                final returnValue = await Navigator.of(
                  context,
                ).pushNamed(routes.pageTwoRoute);
                setState(() {
                  // We use this null check in case the user presses the back button (no data)
                  // instead of our custom back button that actually returns data
                  data = returnValue != null ? returnValue as String : '';
                });
              },
              child: Text('Go To Page Two'),
            ),
            data.isEmpty ? Text('Awaiting Response...') : Text(data),
          ],
        ),
      ),
    );
  }
}
