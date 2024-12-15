import 'package:flutter/material.dart';
import 'package:untitled/widget/textButton.dart';
import 'package:untitled/widget/textField1.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  // Initially, the password is hidden
  bool _isPasswordVisible = false;
  TextEditingController _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 250),
      body: SafeArea(  // Membuat agar tidak tabrakan dengan status/notification bar
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                      decoration: Textfield1(
                        hintText: 'Username or Email',
                        prefixIcon: Icons.person,
                      ).decoration,
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
                      decoration: Textfield1(
                        hintText: 'Password',
                        prefixIcon: Icons.lock,
                      ).decoration.copyWith(
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
                        route: '/forgot-password',
                        textStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color.fromRGBO(252, 147, 3, 1.0), // Color for "Create an Account"
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        )
                      )
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
                            route: '/signup',
                            textStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromRGBO(252, 147, 3, 1.0), // Color for "Create an Account"
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            
            
                ],
              ),
            ),
          ),
        
        ),
      ),
    );

  }
}