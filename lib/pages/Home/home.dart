import 'package:flutter/material.dart';
import 'package:untitled/pages/Home/product_details.dart';
import 'package:untitled/pages/bottomBar.dart';
import 'package:untitled/pages/Home/product_category.dart';
import 'package:untitled/widget/textButton.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List categories =[
    "images/cat.jpeg",
    "images/dog.png",
    "images/hamster.jpeg",
    "images/fish.jpeg"
  ];

  List categoryName =[
    "Cat",
    "Dog",
    "Hamster",
    "Fish"
  ];
  
  // Dummy product list
final List<Map<String, dynamic>> products = [
  {
    "productName": "Whiskas",
    "productImage": "images/MakananHamsterJolly400gr.jpg",
    "description": "Cat food",
    "category": "Cat",
    "price": "Rp 40.000",
    "stock": 10,
    "productSold": 15,
    "sellerName": "Pet Shop A",
    "sellerAddress": "123 Main St"
  },
  {
    "productName": "Alice Sanbbi",
    "productImage": "images/SisirBrushPetGroomingSisirKucingAnjing.jpg",
    "description": "Bathing sand for hamsters",
    "category": "Hamster",
    "price": "Rp 43.000",
    "stock": 8,
    "productSold": 10,
    "sellerName": "Pet Shop B",
    "sellerAddress": "456 Market Rd"
  },
  {
    "productName": "Hamster Cage",
    "productImage": "images/LitterBoxKucingBesarJumboBaskom.png",
    "description": "A small cage for hamsters",
    "category": "Hamster",
    "price": "Rp 30.000",
    "stock": 5,
    "productSold": 9,
    "sellerName": "Pet Shop C",
    "sellerAddress": "789 Pet Lane"
  },
];

  @override
  Widget build(BuildContext context) {
    final FocusNode _focusNode = FocusNode();
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 250),
      
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(     
          child: SingleChildScrollView(
            // Padding agar isi halaman bagian bawah tidak tertutup bottom bar
            padding: EdgeInsets.only(bottom: 90, top: 25),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              "images/photoprofile.jpg",
                              height: 48,
                              width: 48,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: "Hello\n",
                                  style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Daniel Guntoro!",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        height: 1.3,
                                      )
                                    )
                                  ]
                                )
                              
                              ),
                            ],
                          ),
                        ]
                      ),
                      ClipRRect(
                        child: Image.asset(
                          "images/pawlogo.png",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(235, 233, 233, 1),
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        decoration: InputDecoration(
                          border:InputBorder.none,
                          hintText: "Search here",
                          hintStyle: TextStyle(
                    
                          ),
                          prefixIcon: Icon(Icons.search_rounded),
                          // prefixIcon: Padding(
                          //   padding: const EdgeInsets.only(left: 10.0),  // Padding inside prefixIcon
                          //   child: SvgPicture.asset(
                          //     'assets/icon/search-alt-svgrepo-com.svg',  // Path to your SVG file
                          //     height: 30.0,  // Adjust size
                          //     width: 30.0,  // Adjust size
                          //     fit: BoxFit.contain
                          //   ),
                          // ),
                          
                        ),
                        
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),

                  // Kategori
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700
                          )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    margin: EdgeInsets.only(left: 14.0),
                    height: 120.0,
                    child: ListView.builder(
                      itemCount: categories.length,   //tampilkan semua yang ada di categories
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return CategoryTile(image: categories[index], name:categoryName[index]);
                      }
                    ),
                  ),
                  SizedBox(height: 30.0),

                  // Terpopouler
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Most Popular",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700
                          )
                        ),
                        TextbuttonNavigation(
                          text: "see all", 
                          route: '/test', 
                          textStyle: TextStyle(
                            color: Color.fromRGBO(252, 147, 3, 1.0),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.74, // Adjust the aspect ratio to match the card's style
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            // Navigate to details page, passing product data
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetails(product: product),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      product["productImage"],
                                      height: 180,
                                      // width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 8.0),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product["productName"],
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      
                                      Text(
                                        product["price"],
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 3.0,),
                                      Text(
                                        product["sellerName"],
                                        style: const TextStyle(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Montserrat"
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),


                ],
              )
            
            ),
          ),
        
        ),
        
      ),
    );

  }
}

class CategoryTile extends StatelessWidget {
  String image, name;
  CategoryTile({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> ProductCategory(categoryName: name))
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        height: 90.0,
        width: 90.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              height: 90,
              width: 60,
              fit: BoxFit.cover  
            ),
            Icon(Icons.arrow_forward_ios_rounded, color: Colors.orange)
          ]
        ),
      )
    );
  }
}

class toHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Bottombar(initialIndex: 0);  
  }
}

