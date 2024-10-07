import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController(text: 'Иван Иванов');
  final TextEditingController _emailController = TextEditingController(text: 'ivan.ivanov@example.com');
  final TextEditingController _phoneController = TextEditingController(text: '+7 123 456-78-90');
  String _avatarUrl = 'https://www.example.com/avatar.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // Save functionality here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Change avatar functionality
              },
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(_avatarUrl),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Имя и фамилия',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Электронная почта',
                prefixIcon: Icon(Icons.email, color: Colors.blueGrey),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Телефон',
                prefixIcon: Icon(Icons.phone, color: Colors.blueGrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
