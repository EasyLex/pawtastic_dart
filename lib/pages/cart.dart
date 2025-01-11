import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/pages/bottomBar.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final User? user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> deleteCartItem(String cartItemId) async {
    try {
      await firestore
          .collection('users')
          .doc(user?.uid)
          .collection('cart')
          .doc(cartItemId)
          .delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Item removed from cart')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting item: $e')),
      );
    }
  }

  // Handle individual item checkout
  void checkoutItem(Map<String, dynamic> cartItemData) {
    // Trigger your checkout logic here for the specific item
    // You could navigate to a Checkout Page with this data, for example:
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => CheckoutPage(cartItem: cartItemData),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Cart")),
        body: Center(child: const Text("Please log in to view your cart")),
      );
    }

    CollectionReference cartRef =
        firestore.collection('users').doc(user?.uid).collection('cart');

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 250),
      appBar: AppBar(
       automaticallyImplyLeading: false,
       backgroundColor: Colors.white,
       title: Padding(
          padding: const EdgeInsets.only(top: 10.0),  // Add margin for the title
          child: Column(
            mainAxisSize: MainAxisSize.min,  // Ensure the column only takes as much space as needed
            children: [
              // Title Widget
              const Center(
                child: Text(
                  'My Cart',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
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
      body: StreamBuilder<QuerySnapshot>(
        stream: cartRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Your cart is empty.'));
          }

          var cartItems = snapshot.data!.docs;

          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              var cartItem = cartItems[index];
              var cartItemData = cartItem.data() as Map<String, dynamic>;
              String cartItemId = cartItem.id;
              int quantity = cartItemData['quantity'];
              double price = cartItemData['price'];

              return Card(
                color: Colors.white,
                elevation: 3.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Stack(
                  children: [
                    // The actual content of the card
                    ListTile(
                      leading: Image.asset(
                        cartItemData['productImage'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        cartItemData['productName'],
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text('Quantity: $quantity'),
                          Text('Price:\n${NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(price * quantity)}'),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartDetailPage(cartItemData: cartItemData)
                          ),
                        );
                      },
                      trailing: SizedBox(
                        width: 150,  // Set a width constraint to avoid overflow
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => checkoutItem(cartItemData),
                              child: const Text('Checkout'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // The delete icon positioned at the top-right corner
                    Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: IconButton(
                        icon: const Icon(Icons.highlight_remove, color: Colors.red),
                        onPressed: () {
                          deleteCartItem(cartItemId); // Delete the item from cart
                        },
                      ),
                    ),
                  ],
                ),
              );

            },
          );
        },
      ),
    );
  }
}

class CartDetailPage extends StatefulWidget {
  final Map<String, dynamic> cartItemData;  // Add cartItemData as a parameter

  const CartDetailPage({Key? key, required this.cartItemData}) : super(key: key);

  @override
  _CartDetailPageState createState() => _CartDetailPageState();
}

class _CartDetailPageState extends State<CartDetailPage> {
  final User? user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Function to delete a cart item
  Future<void> deleteCartItem(String cartItemId) async {
    try {
      await firestore
          .collection('users')
          .doc(user?.uid)
          .collection('cart')
          .doc(cartItemId)
          .delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Item removed from cart')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting item: $e')),
      );
    }
  }

  // Function to proceed with checkout for the selected cart item
  void checkout() {
    // Handle your checkout logic here (e.g., navigate to a checkout page)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Proceeding with checkout...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Cart")),
        body: Center(child: const Text("Please log in to view your cart")),
      );
    }

    var cartItemData = widget.cartItemData;  // Get the passed cart item data
    String cartItemId = cartItemData['productId']; // Assuming 'productId' is unique
    int quantity = cartItemData['quantity'];
    double price = cartItemData['price'];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 250),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Cart Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListTile(
                leading: Image.asset(
                  cartItemData['productImage'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(cartItemData['productName']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order date: ${DateFormat('dd-MM-yyyy').format(cartItemData['timestamp'].toDate())}'),
                    Text('Price: ${NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(price)}'),
                    Text('Quantity: $quantity'),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.highlight_remove, color: Colors.red),
                  onPressed: () {
                    deleteCartItem(cartItemId); // Delete the item
                  },
                ),
              ),
            ),

            // Total Price for this selected item
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Total Price: ${NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(price * quantity)}',
                style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),

            // Checkout Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: checkout,  // Checkout logic here
                child: const Text('Proceed to Checkout'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
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