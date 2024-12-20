import 'package:flutter/material.dart';
import 'package:untitled/pages/bottomBar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 250),
      body: SafeArea(     
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 10.0),
          child: Center(
            child: Text('Settings', style: TextStyle(fontSize: 24)),
          ),
        )
       
      
      ),
    );
  }
}

class toSettingsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Bottombar(initialIndex: 3);  
  }
}