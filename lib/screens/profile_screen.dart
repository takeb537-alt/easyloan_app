import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
          const SizedBox(height: 10),
          const Text("User Name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Text("user@example.com"),
          const SizedBox(height: 20),
          SwitchListTile(title: const Text("Dark Mode"), value: false, onChanged: (v) {}),
          const ListTile(leading: Icon(Icons.privacy_tip), title: Text("Privacy Policy")),
          const ListTile(leading: Icon(Icons.description), title: Text("Terms & Conditions")),
          const ListTile(leading: Icon(Icons.logout, color: Colors.red), title: Text("Logout", style: TextStyle(color: Colors.red))),
        ],
      ),
    );
  }
}
