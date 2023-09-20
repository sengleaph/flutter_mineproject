import 'package:flutter/material.dart';

import '../order_page/viewcart_page.dart';
import 'product.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  List<String> productTitles = [
    "Popular",
    "Snacks",
    "Burger",
  ];
  int currentTabIndex = 0;
  final PageController _pageController = PageController(keepPage: true);

  // Sample data for products in each category
  List<Product> popularProducts = [
    Product(name: "Product 1", description: "Description of Product 1."),
    Product(name: "Product 2", description: "Description of Product 2."),
    Product(name: "Product 1", description: "Description of Product 1."),
    Product(name: "Product 2", description: "Description of Product 2."),
  ];

  List<Product> coffeeProducts = [
    Product(
        name: "Coffee Product 1",
        description: "Description of Coffee Product 1."),
    Product(
        name: "Coffee Product 2",
        description: "Description of Coffee Product 2."),
    Product(
        name: "Coffee Product 1",
        description: "Description of Coffee Product 1."),
    Product(
        name: "Coffee Product 2",
        description: "Description of Coffee Product 2."),
  ];

  List<Product> teaProducts = [
    Product(
        name: "Tea Product 1", description: "Description of Tea Product 1."),
    Product(
        name: "Tea Product 2", description: "Description of Tea Product 2."),
  ];

  List<Product> milkTeaProducts = [
    Product(
        name: "Burger Product 1",
        description: "Description of Tea Product 1."),
    Product(
        name: "MilkTea Product 2",
        description: "Description of Tea Product 2."),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentTabIndex = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "20 min",
              style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
            )
          ],
        ),
        actions: const [
          Icon(
            Icons.favorite_border_outlined,
            color: Colors.pinkAccent,
            size: 30,
          ),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.search,
            color: Colors.pinkAccent,
            size: 35,
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "KFC Kampuchea Krom",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black54, fontSize: 36),
                        children: <TextSpan>[
                          TextSpan(text: '3.5km away |'),
                          TextSpan(
                              text: ' Free delivery',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                      textScaleFactor: 0.5,
                    ),
                    const Text(
                      "More info",
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star_border_outlined,
                          color: Colors.pinkAccent,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(fontSize: 36),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '4.8',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text: ' .79 ratings',
                                  style: TextStyle(color: Colors.black54)),
                            ],
                          ),
                          textScaleFactor: 0.5,
                        ),
                      ],
                    ),
                    const Text(
                      "See reviews",
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.alarm_add_outlined,
                          color: Colors.pinkAccent,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Delivery 20 min",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        )
                      ],
                    ),
                    Text(
                      "Change",
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 60,
          decoration: const BoxDecoration(color: Colors.white),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productTitles.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Padding(
                  // Add Padding widget
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0),
                  child: Text(
                    productTitles[index],
                    style: TextStyle(
                      fontSize: 18,
                      color: index == currentTabIndex
                          ? Colors.pink[600]
                          : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: productTitles.length,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width *
                    0.8, // Adjust the width of each section
                margin: EdgeInsets.symmetric(
                    vertical: 8.0), // Adjust vertical spacing here
                child: _buildProductSection(index),
              );
            },
          ),
        ),
      ]),
      bottomNavigationBar: GestureDetector(
        onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewCartPage()),
    );
  },
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "1",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    Text(
                      "View your cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "\$ 6.99",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductSection(int index) {
    // Conditionally choose ListView or GridView based on the category's index
    if (index == 0) {
      return ProductSection(
        title: productTitles[index],
        products: popularProducts,
        isGridView: false,
      );
    } else {
      return ProductSection(
        title: productTitles[index],
        products: _getProductsForCategory(index),
        isGridView: true,
      );
    }
  }

  List<Product> _getProductsForCategory(int categoryIndex) {
    switch (categoryIndex) {
      case 1:
        return coffeeProducts;
      case 2:
        return teaProducts;
      case 3:
        return milkTeaProducts;
      default:
        return [];
    }
  }
}

class Product {
  final String name;
  final String description;

  Product({required this.name, required this.description});
}
