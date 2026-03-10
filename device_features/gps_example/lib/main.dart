import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Stores our current position, initialized in initState
  Position? _position;

  Future<Position> _determinePosition() async {
    // Handle all the permission checks

    // Tracks whether location services are even enabled on the device
    bool serviceEnabled;

    // Tracks the permission status for this app
    LocationPermission permission;

    // Validate location services are running
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location Service Disabled on this device');
    }

    // Check the current permission status
    permission = await Geolocator.checkPermission();
    // If we don't have access yet, ask for it
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // User has denied us access, decide how to handle that
        return Future.error('Location Permissions are Denied');
      }
    }

    // If after checking/requesting permissions it's permanently denied, throw an error
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Permissions are permanently denied');
    }

    // If we've gotten to here, we have permission and can safely access location

    // Get location and return it
    return await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.best),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Location: ${_position ?? 'unknown'}'),
              ElevatedButton(
                onPressed: () async {
                  final temp = await _determinePosition();
                  setState(() {
                    _position = temp;
                  });
                },
                child: Text('Get Current Location'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
