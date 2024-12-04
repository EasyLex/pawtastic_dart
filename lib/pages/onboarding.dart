

import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFFFC9303), // untuk warna tema Pawtastic
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Warna background putih
      body: Container(
        margin: const EdgeInsets.only(top: 100.0), // memberi jarak dari atas
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,   //tidak diperlukan karena sudah di dalam widget center
                children: [
                    Image.asset(              
                    "images/starting_page.png",   // nama file tidak boleh ada spasi
                    // width: double.infinity, // jika lebar gambar dibuat (horizontal) memenuhi layar
                    width: 300.0, 
                    height: 200.0,
                    fit: BoxFit.cover, // Adjust how the image fits within the size
                  ),
                  const SizedBox(height: 20),  // Add space between image and text
                  Align(
                      // alignment: Alignment.center,
                      child: Text(
                        "RUFF!\nWelcome to Pawtastic!",
                        textAlign: TextAlign.center,  //menengahkan teks bergantung widget
                        style: TextStyle(
                          fontFamily: 'Montserrat',   //font custom, tidak menggunakan global
                          color: Colors.black,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),                    
                    ),
                  const SizedBox(height: 30),
                  Align(
                    // alignment: Alignment.center,
                    child: Text(
                      "One app for all of your\npet equipment!",
                      textAlign: TextAlign.center,  //menengahkan teks bergantung widget
                      style: TextStyle(
                        fontFamily: 'Montserrat',   //font custom, tidak menggunakan global
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        height: 24/16,          //line height di figma dibagi font size
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  
                  // Get Started Button
                  ElevatedButton(
                    onPressed: () {
                      // Action for Get Started button
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, // Transparent background
                      elevation: 0,                        // No shadow
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.orange,             // Orange text color
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // const SizedBox(height: 10), 
                  
                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      // Action for Login button
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, // Transparent background
                      elevation: 0,                        // No shadow
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,              // Black text color
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ]
              )
            ),
            
            
            
          ],
        ),
      ),
    );
  }

}

