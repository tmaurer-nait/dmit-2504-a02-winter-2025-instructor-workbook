import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
            image: DecorationImage(
              image: AssetImage(('assets/images/sulley_profile.jpg')),
              fit: BoxFit.cover,
            ),
            border: Border.all(width: 4, color: Colors.purple),
          ),
        ),
        Text(
          'James P Sullivan (Sulley)',
          style: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.italic,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
