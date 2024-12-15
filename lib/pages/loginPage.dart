import 'package:flutter/material.dart';
import 'package:untitled/widget/textButton.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  // Initially, the password is hidden
  bool _isPasswordVisible = false;
  TextEditingController _passwordController = TextEditingController();

  // Function to update opacity
  void _setOpacity(double opacity) {
    setState(() {});
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 250),
      body: SafeArea(  // Membuat agar tidak tabrakan dengan status/notification bar
        child: Container(
          margin: EdgeInsets.only(top: 50),
          // Alignment dibawah penting agar bisa di-atas tengah-kan
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Ensures children are horizontally centered
            mainAxisSize: MainAxisSize.min, // Avoids unnecessary expansion
            children: [
              Text(
                "Welcome\nBack!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontSize: 36.0,
                  fontWeight: FontWeight.w800,
                  height: 47 / 36,
                ),
              ),
              const SizedBox(height: 30),
              
              Container(
                width: 350,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Username or Email',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color.fromRGBO(163, 163, 163, 1.0),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                    // prefixIcon = di dalam box, icon = di luar kiri box
                    prefixIcon: Icon(Icons.person),
                    
                    filled: true,
                    fillColor: Color.fromRGBO(228, 228, 228, 0.612),
                    contentPadding: EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                      left: 14.0,
                      right: 14.0,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      // outline border
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Color.fromRGBO(168, 168, 169, 1.0),
                      )
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 20),
              
              Container(
                width: 350,
                height: 55,
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible, // If false, password is visible
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color.fromRGBO(163, 163, 163, 1.0),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                    prefixIcon: Icon(Icons.lock),
                    filled: true,
                    fillColor: Color.fromRGBO(228, 228, 228, 0.612),
                    contentPadding: EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                      left: 14.0,
                      right: 14.0,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      // outline border
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Color.fromRGBO(168, 168, 169, 1.0),
                      )
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: 340,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextbuttonNavigation(
                    text: 'Forgot your password?',
                    route: '/',
                    // setOpacity: _setOpacity, 
                    textStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color.fromRGBO(252, 147, 3, 1.0), // Color for "Create an Account"
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    )
                  )
                  // TextButton(
                  //   // passing ke _onPressed setiap textbutton untuk interaktif textButton
                  //   onPressed: () {
                  //     TextbuttonNavigation.onPressed(context, '/', _setOpacity);
                  //   },
                  //   style: TextButton.styleFrom(
                  //     padding: EdgeInsets.zero, // Removes any padding around the TextButton
                  //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //     // membuat agar tidak ada highliht button
                  //     splashFactory: NoSplash.splashFactory, // Remove splash effect
                  //     foregroundColor: Colors.transparent, // Remove text color change effect
                  //     overlayColor: Colors.transparent, // Remove overlay effect
                  //     backgroundColor: Colors.transparent, // Remove highlight color
                  //   ),
                  //   child: Text(
                  //     'Forgot your password?', // The text inside the TextButton
                  //     style: TextStyle(
                  //       fontFamily: 'Montserrat',
                  //       color: Color.fromRGBO(252, 147, 3, _opacity), // Color for "Create an Account"
                  //       fontSize: 14.0,
                  //       fontWeight: FontWeight.w500,
                  //     ),
                  //   ),
                  // ),
                ),
              ),
              
              const SizedBox(height: 50),
              
              Container(
                width: 350,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(252, 147, 3, 1.0), // Set button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0), // Set border radius
                    ), 
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text(
                      "Login",
                      style:TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                      )
                      
                    ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                height: 50.0,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Ensures the Row only takes the necessary width
                    children: [
                      Text(
                        'Or, ', // First part "Or,"
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color.fromRGBO(87, 87, 87, 1.0),  // Color for "Or,"
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextbuttonNavigation(
                        text: 'Create an Account',
                        route: '/login',
                        // setOpacity: _setOpacity,
                        textStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color.fromRGBO(252, 147, 3, 1.0), // Color for "Create an Account"
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // TextButton(
                      //   // passing ke _onPressed setiap textbutton untuk interaktif textButton
                      //   onPressed: () {
                      //     // TextbuttonNavigation.onPressed(context, '/', _setOpacity);
                      //   },
                      //   style: TextButton.styleFrom(
                      //     padding: EdgeInsets.zero, // Removes any padding around the TextButton
                      //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      //     // membuat agar tidak ada highliht button
                      //     splashFactory: NoSplash.splashFactory, // Remove splash effect
                      //     foregroundColor: Colors.transparent, // Remove text color change effect
                      //     overlayColor: Colors.transparent, // Remove overlay effect
                      //     backgroundColor: Colors.transparent, // Remove highlight color
                      //   ),
                      //   child: Text(
                      //     'Create an Account', // The text inside the TextButton
                      //     style: TextStyle(
                      //       fontFamily: 'Montserrat',
                      //       color: Color.fromRGBO(252, 147, 3, _opacity), // Color for "Create an Account"
                      //       fontSize: 15.0,
                      //       fontWeight: FontWeight.w500,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );

  }
}