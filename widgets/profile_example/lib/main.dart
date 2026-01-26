import 'package:flutter/material.dart';
import 'package:profile_example/widgets/profile_picture.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Simple Layout Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Employee Profile',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              ProfilePicture(),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    ProfileInfo(),
                    Row(
                      children: [
                        Text(
                          'Team: ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Scarers', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Handle: ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('@Scary_Sulley', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Supervisor: ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Mike Wazowski', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
