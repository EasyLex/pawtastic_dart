import 'package:flutter/material.dart';
import 'package:untitled/pages/bottomBar.dart';
import 'package:untitled/widget/textField1.dart';

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
          padding: EdgeInsets.only(bottom: 90, top: 25),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            "images/photoprofile.jpg",
                            height: 48,
                            width: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: "Hello\n",
                                style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      height: 1.3,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Daniel Guntoro!",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      height: 1.3,
                                    )
                                  )
                                ]
                              )
                            
                            ),
                          ],
                        ),
                      ]
                    ),
                    ClipRRect(
                      child: Image.asset(
                        "images/pawlogo.png",
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(235, 233, 233, 1),
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    decoration: InputDecoration(
                      border:InputBorder.none,
                      hintText: "Search here",
                      hintStyle: TextStyle(

                      ),
                      prefixIcon: Icon(Icons.search_rounded),
                    ),
                  ),
                )

              ],
            )
          
          ),
        ),
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
