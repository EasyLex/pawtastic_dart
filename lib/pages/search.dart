import 'package:flutter/material.dart';
import 'package:untitled/pages/bottomBar.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 250),
      body: SafeArea(     
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 10.0),
          child: Center(
            child: Text('Search', style: TextStyle(fontSize: 24)),
          ),
        )
       
      
      ),
    );
  }
}

class toSearchPage extends StatelessWidget{
  const toSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Bottombar(initialIndex: 4);  
  }
}