import 'package:flutter/material.dart';

class ProductCategory extends StatefulWidget {
  final String categoryName;
  const ProductCategory({super.key, required this.categoryName});

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        toolbarHeight: 75,    //tinggi appBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        titleSpacing: 0,  // Remove any default padding for the title
        flexibleSpace: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(imagePath),  // Display the category image
                const Text(
                  'Product Category',  
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0,
                  ),
                ),
                Text(
                  widget.categoryName,  // Display the category name
                  style: TextStyle(
                    color: Color.fromRGBO(252, 147, 3, 1.0),
                    fontSize: 19.0, 
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      backgroundColor: const Color.fromARGB(255, 255, 250, 250),
    );
  }
}