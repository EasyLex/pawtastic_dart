import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  // Data tim (nama, jobdesc, dan URL foto)
  final List<Map<String, String>> teamMembers = [
    {
      "name": "Alexander Nathaniel Anggiono",
      "jobdesc": "Backend Developer",
      "photo": "images/alex.jpg", // Ganti dengan URL foto asli
    },
    {
      "name": "Muhammad Naufal Musyaddad",
      "jobdesc": "Backend Developer",
      "photo": "images/musyaddad.jpg", // Ganti dengan URL foto asli
    },
    {
      "name": "Kevin",
      "jobdesc": "Frontend Developer",
      "photo": "images/kevin.jpg", // Ganti dengan URL foto asli
    },
    {
      "name": "Daniel Guntoro",
      "jobdesc": "Frontend Developer",
      "photo": "images/daniel.jpg", // Ganti dengan URL foto asli
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meet Our Team"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Dua kolom dalam satu baris
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: teamMembers.length,
          itemBuilder: (context, index) {
            final member = teamMembers[index];
            return Column(
              children: [
                // Foto tim
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      100), // Membuat foto menjadi lingkaran
                  child: Image.asset(
                    member["photo"]!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                // Nama
                Text(
                  member["name"]!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                // Jobdesc
                Text(
                  member["jobdesc"]!,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: AboutUs()));
