import 'package:flutter/material.dart';
import 'package:profile_example/widgets/profile_picture.dart';
import 'package:profile_example/widgets/profile_info.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Layout Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Employee Profile',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                fontFamily: 'BitCountProp',
              ),
            ),
            ProfilePicture(),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  ProfileInfo(label: 'Role', value: 'Scarer'),
                  ProfileInfo(label: 'Team', value: 'Scare Team 6'),
                  ProfileInfo(label: 'Handle', value: '@TheRealSully'),
                  ProfileInfo(label: 'Supervisor', value: 'Mike Wazowski'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
