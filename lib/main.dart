import 'package:flutter/material.dart';
import 'package:untitled/pages/bottomBar.dart';
import 'package:untitled/pages/cart.dart';
import 'package:untitled/pages/Orders/myOrders.dart';
import 'package:untitled/pages/search.dart';
import 'package:untitled/pages/settings.dart';
import 'package:untitled/pages/starting/forgotPassword.dart';
import 'package:untitled/pages/home.dart';
import 'package:untitled/pages/starting/loginPage.dart';
import 'package:untitled/pages/starting/onboarding.dart';
import 'package:untitled/pages/starting/signupPage.dart';
import 'package:untitled/pages/starting-animation.dart';
import 'package:untitled/pages/test-page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins', // membuat font Poppins untuk keseluruhan file
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 93, 0, 255)),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16.0),
          displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
        useMaterial3: true,
      ),
      routes: {
        '/test': (context) => TestPage(),
        '/': (context) => const StartingAnimation(),
        '/welcome': (context) => const Onboarding(),
        '/login': (context) => const Loginpage(),
        '/signup': (context) => const Signuppage(),
        '/forgot-password': (context) => const Forgotpassword(),
        '/home': (context) => toHomePage(),
        // '/home': (context) => Bottombar(initialIndex: 0),    // jangan dihapus
        '/cart': (context) => toCartPage(),
        '/my-orders': (context) => toMyOrdersPage(),
        // '/detail-orders': (context) => Detailorders(),
        '/settings': (context) => toSettingsPage(),
        '/search': (context) => toSearchPage(),
      },
      initialRoute: '/',
      // initialRoute: '/home',   // jangan dihapus
    );
  }
}

