import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StartingAnimation extends StatefulWidget {
  const StartingAnimation({super.key});

  @override
  State<StartingAnimation> createState() => _StartingAnimationState();
}

class _StartingAnimationState extends State<StartingAnimation> {
  
  @override
  void initState() {
    super.initState();
    _navigateToWelcomeScreen();
  }

  // Navigate to the next screen (Welcome) after a delay
  Future<void> _navigateToWelcomeScreen() async {
    await Future.delayed(Duration(seconds: 3)); // Show splash for 3 seconds
    Navigator.pushReplacementNamed(context, '/welcome'); // Use route to navigate
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 147, 3, 1.0), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display your image
            Image.asset('images/logo_pawtastic-removebg-preview.png', width: 314, height: 385),

            // Add some space between the image and animation
            SizedBox(height: 20),

            // Display the Lottie animation
            Lottie.asset('assets/animation/loadingwhite.json', width: 200, height: 200),
          ],
        ),
      ),
    );
  }
}