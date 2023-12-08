import 'package:flutter/material.dart';

class VegetablesPage extends StatelessWidget {
  final List<Product> vegetables = [
    Product('Carrot', 'Rich in Vitamin A.', 'assets/carrot.jpg', 20.0),
    Product('Onion', 'Adds flavor to dishes.', 'assets/onion.jpg', 15.0),
    Product('Tomato', 'Rich in antioxidants.', 'assets/tomato.jpg', 18.0),
    Product('Beetroot', 'Good for heart health.', 'assets/beetroot.jpg', 22.0),
    Product('Potato', 'Versatile and nutritious.', 'assets/potato.jpg', 25.0),
    Product('Cabbage', 'Low in calories, high in nutrients.', 'assets/cabbage.jpg', 25.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vegetables'),
        backgroundColor: const Color.fromARGB(255, 71, 171, 74),
      ),
      backgroundColor: Color.fromARGB(255, 128, 230, 131),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: vegetables.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _showProductDetails(context, vegetables[index]);
            },
            child: _buildVegetableItem(vegetables[index]),
          );
        },
      ),
    );
  }

  Widget _buildVegetableItem(Product product) {
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

