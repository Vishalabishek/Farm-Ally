import 'package:flutter/material.dart';

class DairyProductsPage extends StatelessWidget {
  final List<Product> dairyProducts = [
    Product('Milk', 'Rich in calcium and essential nutrients.', 'assets/milk.jpg', 35.0),
    Product('Cheese', 'A dairy product made from milk.', 'assets/cheese.jpg', 80.0),
    Product('Yogurt', 'Probiotic-rich fermented dairy product.', 'assets/yogurt.jpg', 25.0),
    Product('Butter', 'Used for cooking and baking.', 'assets/butter.jpg', 45.0),
    Product('Paneer', 'Indian cheese used in various dishes.', 'assets/panner.jpg', 70.0),
    Product('Cream', 'Used in desserts and cooking.', 'assets/cream.jpg', 60.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dairy Products'),
        backgroundColor: const Color.fromARGB(255, 71, 171, 74),
      ),
      backgroundColor: Color.fromARGB(255, 128, 230, 131),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: dairyProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _showProductDetails(context, dairyProducts[index]);
            },
            child: _buildDairyProductItem(dairyProducts[index]),
          );
        },
      ),
    );
  }

  Widget _buildDairyProductItem(Product product) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(product.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            product.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            '\₹${product.price.toStringAsFixed(2)}',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  void _showProductDetails(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(product.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                product.imagePath,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 8.0),
              Text(
                product.description,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '\₹${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implement add to cart action
                    },
                    child: Text('Add to Cart'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement buy now action
                    },
                    child: Text('Buy Now'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class Product {
  final String name;
  final String description;
  final String imagePath;
  final double price;

  Product(this.name, this.description, this.imagePath, this.price);
}

