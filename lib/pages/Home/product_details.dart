import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetails({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product["productName"]),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 250, 250),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product["productImage"],
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              product["productName"],
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              product["price"],
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text("Description: ${product["description"]}"),
            Text("Category: ${product["category"]}"),
            Text("Stock: ${product["stock"]}"),
            Text("Seller: ${product["sellerName"]}"),
            Text("Address: ${product["sellerAddress"]}"),
          ],
        ),
      ),
    );
  }
}
