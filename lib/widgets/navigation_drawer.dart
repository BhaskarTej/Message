import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)!.settings.name;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Theme.of(context).primaryColor),
                ),
                SizedBox(height: 10),
                Text(
                  'John Doe', // Replace with dynamic user name
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  'johndoe@example.com', // Replace with dynamic user email
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.dashboard,
            text: 'Message Boards',
            routeName: '/home',
            isSelected: currentRoute == '/home',
          ),
          _buildDrawerItem(
            context,
            icon: Icons.person,
            text: 'Profile',
            routeName: '/profile',
            isSelected: currentRoute == '/profile',
          ),
          _buildDrawerItem(
            context,
            icon: Icons.settings,
            text: 'Settings',
            routeName: '/settings',
            isSelected: currentRoute == '/settings',
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () async {
              Navigator.pop(context);
              await FirebaseAuth.instance.signOut(); // Logout logic
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String text,
    required String routeName,
    required bool isSelected,
  }) {
    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.blue : null),
      title: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.blue : null,
          fontWeight: isSelected ? FontWeight.bold : null,
        ),
      ),
      onTap: () {
        if (ModalRoute.of(context)!.settings.name != routeName) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, routeName);
        }
      },
    );
  }
}