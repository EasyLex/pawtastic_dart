import 'package:flutter/material.dart';
import 'package:untitled/pages/Home/product_category.dart';
import 'package:untitled/pages/Product-Page/seller_product_list.dart';

class ProductDetails extends StatelessWidget {
  final Map<String, dynamic> product;
  final List<Map<String, dynamic>> allProducts;  // The list of all products passed

  const ProductDetails({
    required this.product,
    required this.allProducts,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure categories is a list (in case it's a single string)
    List<dynamic> categories = product["category"] is List
        ? product["category"]
        : [product["category"]];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 250, 250),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Center(
                child: Image.asset(
                  product["productImage"],
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16.0),

              // Product Name
              Text(
                product["productName"],
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Price and Product Sold + Stock in a row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rp ${product["price"]}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Color.fromRGBO(252, 147, 3, 1.0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Sold: ${product["productSold"]}',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Text(
                        'Stock: ${product["stock"]}',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // "For:" label and category box
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "For: ",
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: List.generate(
                      categories.length,
                      (index) => GestureDetector(
                        
                        onTap: () {
                          // final filteredProducts = product
                          //       .where((product) => product['category'].contains(categories[index]))    // Check if the category array contains the current category
                          //       .toList();

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => ProductCategory(categoryName: categories[index], products: filteredProducts)),
                          // );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(13.0),
                            // No outline
                          ),
                          child: Text(
                            categories[index],  // Display the category
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(252, 147, 3, 1.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // Description
              Text(
                "Description", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,  // Make the "Description:" label bold
                  fontSize: 16.0,
                ),
              ),
              // const SizedBox(height: 8.0),
              Text(
                product["description"],  // Content in normal font weight
                style: const TextStyle(
                  fontWeight: FontWeight.normal,  // Regular font weight for the content
                  fontSize: 14.0,
                ),
              ),

              // Grey Divider Line
              Divider(color: Colors.grey.shade300),
              const SizedBox(height: 8.0),

              // Seller Info
              Text(
                "Seller", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,  // Make the "Description:" label bold
                  fontSize: 16.0,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Seller Info (in one row with right arrow)
                  TextButton(
                  onPressed: () {
                    // Filter products based on the selected seller name
                    final sellerProducts = _getSellerProducts(product['sellerName']);

                    // Navigate to a new screen showing the products by this seller
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SellerProductList(
                          sellerName: product['sellerName'],
                          sellerProducts: sellerProducts, // Passing filtered products
                        ),
                      ),
                    );

                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent, // Make the button background transparent
                      padding: EdgeInsets.zero, // Remove padding to make the button fit the content
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink the tap area to content size
                      shape: RoundedRectangleBorder( // Ensure the button has square corners
                        borderRadius: BorderRadius.zero, // No rounded corners
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Seller Name and Address
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${product["sellerName"]}",
                                  style: TextStyle(
                                    color: Color.fromRGBO(252, 147, 3, 1.0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold, // Make the seller name bold
                                  ),
                                ),
                                Text(
                                  "${product["sellerAddress"]}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400
                                  )  
                                ),
                              ],
                            ),
                            // Right Arrow Icon
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromRGBO(252, 147, 3, 1.0), // Right arrow icon
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                      ],
                    ),
                  ),
                ],
              ),


              const SizedBox(height: 40.0), // To push the button down a bit

              // Grey Divider Line
              Divider(color: Colors.grey.shade300),
            ],
          ),
        ),
      ),
      // Add to Cart button always at the bottom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle Add to Cart action
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            backgroundColor: Color.fromRGBO(252, 147, 3, 1.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: const Text(
            'Add to Cart',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _getSellerProducts(String sellerName) {
    // Filter the products by the seller's name
    return allProducts.where((product) => product['sellerName'] == sellerName).toList();
  }
}


