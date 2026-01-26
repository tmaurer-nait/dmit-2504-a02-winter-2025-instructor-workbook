import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
