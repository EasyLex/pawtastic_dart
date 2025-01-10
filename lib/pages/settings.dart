import 'package:flutter/material.dart';
import 'package:untitled/pages/bottomBar.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            // Profile Section
            Column(
              children: [
                // Profile Picture
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'images/photoprofile.jpg'), // Ganti dengan path foto profil
                ),
                SizedBox(height: 10),
                // Profile Name
                Text(
                  'Daniel Guntoro',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            // Menu List
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  MenuItem(
                    icon: Icons.person,
                    text: 'Profile',
                    onTap: () {
                      // Handle navigation
                    },
                  ),
                  MenuItem(
                    icon: Icons.settings,
                    text: 'Options',
                    onTap: () {
                      // Handle navigation
                    },
                  ),
                  MenuItem(
                    icon: Icons.store,
                    text: 'Paw Shop',
                    onTap: () {
                      // Handle navigation
                    },
                  ),
                  MenuItem(
                    icon: Icons.share,
                    text: 'About Us',
                    onTap: () {
                      // Handle navigation
                    },
                  ),
                ],
              ),
            ),
            // Sign Out
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 220),
              child: TextButton(
                onPressed: () {
                  // Handle sign out
                },
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const MenuItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.orange),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}

class toSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Bottombar(initialIndex: 3);
  }
}
