import 'package:flutter/material.dart';
import 'package:untitled/pages/bottomBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 250),
      body: SafeArea(     
        child: SingleChildScrollView(
          // Padding agar isi halaman bagian bawah tidak tertutup bottom bar
          padding: EdgeInsets.only(bottom: 90),
          child: Column(
            children: List.generate(50, (index) {
              return ListTile(
                title: Text('Item $index'),
              );
            }),
          ),
        ),
        // child: Container(
        //   margin: EdgeInsets.only(top: 30, left: 10.0),
        //   child: Center(
        //     child: Text('Home Page', style: TextStyle(fontSize: 24)),
        //   ),
        // )
       
      
      ),
    );
  }
}

class toHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Bottombar(initialIndex: 0);  
  }
}
