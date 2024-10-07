import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Для примера используем статические данные
    // В реальном приложении эти данные могут загружаться из профиля пользователя
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Аватар
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://www.example.com/avatar.jpg', // Замените на URL вашего аватара или используйте AssetImage
              ),
            ),
            const SizedBox(height: 20),
            // Имя и фамилия
            Text(
              'Иван Иванов',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Электронная почта
            Row(
              children: const [
                Icon(Icons.email, color: Colors.blueGrey),
                SizedBox(width: 10),
                Text(
                  'ivan.ivanov@example.com',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Телефон
            Row(
              children: const [
                Icon(Icons.phone, color: Colors.blueGrey),
                SizedBox(width: 10),
                Text(
                  '+7 123 456-78-90',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
