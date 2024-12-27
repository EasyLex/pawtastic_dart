import 'package:flutter/material.dart';
import 'package:untitled/pages/cart.dart';
import 'package:untitled/pages/home.dart';
import 'package:untitled/pages/Orders/myOrders.dart';
import 'package:untitled/pages/search.dart';
import 'package:untitled/pages/settings.dart';
import 'package:untitled/widget/tophalfcircleborder.dart';

class Bottombar extends StatefulWidget {
  final int initialIndex;  // Add a parameter for initial index
  const Bottombar({super.key, this.initialIndex = 0});  // Default to Home page

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;  // Set the initial index based on the passed parameter
  }

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(55),
      body: Stack(
        children: [
          // The main content of the body based on the currentIndex
          IndexedStack(
            index: currentIndex, // Change this based on the selected index
            children: [
              Home(),
              Cart(),
              MyOrders(),
              Settings(),
              Search(),
            ],
          ),
          
          // The bottom navigation bar
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 70,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 70),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.8,
                    child: FloatingActionButton(
                      backgroundColor: currentIndex == 4 ? Color.fromRGBO(252, 147, 3, 1.0) : Colors.white,
                      child: Icon(Icons.search_rounded),
                      elevation: 0.1,
                      // shape: TopHalfCircleBorder(strokeWidth: 1.5, outlineColor: Color.fromRGBO(252, 147, 3, 1.0)), // Use custom ,
                      shape: CircleBorder(
                        side: BorderSide(
                          color: Color.fromRGBO(252, 147, 3, 1.0), // Set the border color
                          width: 2.0, // Set the border width
                        ),
                      ),
                      onPressed: () {
                        setBottomBarIndex(4);
                      },
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Home icon with text
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.home,
                                color: currentIndex == 0 ? Color.fromRGBO(252, 147, 3, 1.0) : Colors.black,
                              ),
                              onPressed: () {
                                setBottomBarIndex(0);
                              },
                              splashColor: Colors.white,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: currentIndex == 0 ? Color.fromRGBO(252, 147, 3, 1.0) : Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        // Cart icon with text
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.shopping_cart,
                                color: currentIndex == 1 ? Color.fromRGBO(252, 147, 3, 1.0) : Colors.black,
                              ),
                              onPressed: () {
                                setBottomBarIndex(1);
                              },
                            ),
                            Text(
                              'Cart',
                              style: TextStyle(
                                color: currentIndex == 1 ? Color.fromRGBO(252, 147, 3, 1.0) : Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        // Empty space between icons
                        Container(
                          width: size.width * 0.20,
                        ),
                        // Bag icon with text
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.shopping_bag_rounded,
                                color: currentIndex == 2 ? Color.fromRGBO(252, 147, 3, 1.0) : Colors.black,
                              ),
                              onPressed: () {
                                setBottomBarIndex(2);
                              },
                            ),
                            Text(
                              'My Orders',
                              style: TextStyle(
                                color: currentIndex == 2 ? Color.fromRGBO(252, 147, 3, 1.0) : Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        // Settings icon with text
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.settings,
                                color: currentIndex == 3 ? Color.fromRGBO(252, 147, 3, 1.0) : Colors.black,
                              ),
                              onPressed: () {
                                setBottomBarIndex(3);
                              },
                            ),
                            Text(
                              'Settings',
                              style: TextStyle(
                                color: currentIndex == 3 ? Color.fromRGBO(252, 147, 3, 1.0) : Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white // Fill color
      ..style = PaintingStyle.fill;

    Paint outlinePaint = Paint()
      ..color = Color.fromRGBO(252, 147, 3, 1.0) // Outline color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5; // Outline width

    Path path = Path();
    path.moveTo(0.2, 0); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);

    // Draw the shadow
    canvas.drawShadow(path, Colors.black, 5, true);
    // Draw the filled path
    canvas.drawPath(path, paint);
    // Draw the outline
    canvas.drawPath(path, outlinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}