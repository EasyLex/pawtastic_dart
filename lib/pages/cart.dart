import 'package:flutter/material.dart';
import 'package:untitled/pages/bottomBar.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 250),
      body: SafeArea(     //Membuat agar tidak tabrakan dengan status/notification bar
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 10.0),
          child: Center(
            child: Text('Cart', style: TextStyle(fontSize: 24)),
          ),
        )
       
      
      ),
    );
  }
}

class toCartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Bottombar(initialIndex: 1);  
  }
}