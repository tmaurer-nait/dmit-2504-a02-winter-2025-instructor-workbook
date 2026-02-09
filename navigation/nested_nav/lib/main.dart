import 'package:flutter/material.dart';
import 'package:nested_nav/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // A third option for routing/setting home pages is onGenerateRoute
      // This takes a callback function that itself takes in a RouteSettings
      // parameter. RouteSettings includes the name and arguments of a given route.
      // It then returns a route to navigate to.
      onGenerateRoute: (settings) {
        // We'll use this variable to store the return page
        late Widget page;

        // switching on settings.name allows us to check the route name
        switch (settings.name) {
          case '/':
            page = HomePage();

            break;
          default:
        }

        // At the end return the selected page in a route
        return MaterialPageRoute(
          builder: (context) => page,
          settings: settings,
        );
      },
    );
  }
}
