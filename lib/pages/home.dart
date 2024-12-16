import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(     //Membuat agar tidak tabrakan dengan status/notification bar
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "This UI avoids the status bar without an AppBar.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/welcome');
                },
                child: const Text("Back"),
              ),
            ],
          ),
        )
       
      
      ),
    );
  }
}