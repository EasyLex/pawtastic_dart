import 'package:flutter/material.dart';
import 'package:untitled/pages/Orders/myOrders.dart';

class Detailorders extends StatefulWidget {
  final Order order;  // menerima object Order

  // Modify the constructor to accept the orderId parameter
  const Detailorders({super.key, required this.order});

  @override
  State<Detailorders> createState() => _DetailordersState();
}

class _DetailordersState extends State<Detailorders> {
  late Order order;  // Declare the order variable here

  @override
  void initState() {
    super.initState();
    // Initialize the order in initState to ensure it's available before build
    order = widget.order;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        automaticallyImplyLeading: false,  // Remove back button
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),  // Add margin for the title
          child: Column(
            mainAxisSize: MainAxisSize.min,  // Ensure the column only takes as much space as needed
            children: [
              // Title Widget
              const Center(
                child: Text(
                  'My Orders',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,  
                  ),
                ),
              ),
              // Add a SizedBox after the title
              // const SizedBox(height: 20.0),  // Space between title and the TabBar
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 250, 250),
      body: Center(
        child: Text(
          'Details for Order №${order.orderId}',  // Use the order ID passed from CompletedOrders
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}