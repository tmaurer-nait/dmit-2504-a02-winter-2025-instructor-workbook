import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Role: ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text('Scarer', style: TextStyle(fontSize: 20)),
      ],
    );
  }
}
