import 'package:flutter/material.dart';

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
              ClipOval(
                child: Image(
                  semanticLabel: "Picture of Sulley",
                  image: AssetImage('assets/images/sulley_profile.jpg'),
                  height: 250,
                  width: 250,
                ),
              ),
              Text(
                'James P Sullivan (Sulley)',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Role: ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Scarer', style: TextStyle(fontSize: 20)),
                      ],
                    ),
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
