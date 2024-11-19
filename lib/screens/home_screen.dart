import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> messageBoards = [
    {'name': 'General Discussion', 'icon': Icons.chat},
    {'name': 'Tech Talk', 'icon': Icons.computer},
    {'name': 'Random', 'icon': Icons.casino},
    {'name': 'News', 'icon': Icons.newspaper},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Boards'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Message Boards'),
              onTap: () => Navigator.pushReplacementNamed(context, '/home'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: messageBoards.length,
        itemBuilder: (context, index) {
          final board = messageBoards[index];
          return ListTile(
            leading: Icon(board['icon']),
            title: Text(board['name']),
            onTap: () => Navigator.pushNamed(
              context,
              '/chat',
              arguments: board['name'],
            ),
          );
        },
      ),
    );
  }
}