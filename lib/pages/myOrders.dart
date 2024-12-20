import 'package:flutter/material.dart';
import 'package:untitled/pages/bottomBar.dart';

// MyOrders Page with TabBar (Nested Navigation)
class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);  // 3 tabs for processing, completed, and cancelled
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 250),
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
        
        iconTheme: const IconThemeData(color: Colors.black),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Column(
          children: [
            
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,  // This ensures indicator takes up the full width of the tab
                // indicatorWeight: 4.0,
                indicator: BoxDecoration(
                  color: Color.fromRGBO(252, 147, 3, 1.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
               labelStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
                tabs: const [
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),  // Add padding to create space around text
                      child: Text('Delivered'),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),  // Add padding to create space around text
                      child: Text('Processing'),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17.0),  // Add padding to create space around text
                      child: Text('Cancelled'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height:5.0),
          ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ProcessingOrders(),  // You should define these widgets
          CompletedOrders(),
          CancelledOrders(),
        ],
      ),
    );
  }
}

// Sub-page Widgets
class ProcessingOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 186, 186),
      body: SafeArea(     
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 10.0),
          child: Center(
            child: Text('Processing orders'),
          ),
        )
       
      ),
    );
  }
}

class CompletedOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 250),
      body: SafeArea(     
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 10.0),
          child: Center(
            child: Text('Completed orders'),
          ),
        )
       
      ),
    );
  }
}

class CancelledOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 250),
      body: SafeArea(     
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 10.0),
          child: Center(
            child: Text('Cancelled orders'),
          ),
        )
       
      ),
    );
  }
}

class toMyOrdersPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Bottombar(initialIndex: 2);  
  }
}