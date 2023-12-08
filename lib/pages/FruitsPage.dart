import 'package:flutter/material.dart';
import 'CheckOutPage.dart';

class FruitsPage extends StatelessWidget {
  final List<Product> fruits = [
    Product('Apple', 'An apple a day keeps the doctor away.', 'assets/apple.jpg', 25.0),
    Product('Banana', 'Rich in potassium and good for energy.', 'assets/banana.jpg', 30.0),
    // Add more products similarly
    Product('Mango', 'Sweet and delicious tropical fruit.', 'assets/mango.jpg', 20.0),
    Product('Orange', 'Rich in Vitamin C.', 'assets/orange.jpg', 15.0),
    Product('Grapes', 'Small, juicy, and delicious.', 'assets/grapes.jpg', 40.0),
    Product('Strawberry', 'Small, red, and sweet.', 'assets/strawberry.jpg', 50.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruits'),
        backgroundColor: const Color.fromARGB(255, 71, 171, 74),
      ),
      backgroundColor:Color.fromARGB(255, 128, 230, 131),
      body: 
      GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: fruits.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _showProductDetails(context, fruits[index]);
            },
            child: _buildFruitItem(fruits[index]),
          );
        },
      ),
    );
  }

  Widget _buildFruitItem(Product product) {
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
            // Existing code for displaying product details...

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckOutPage(
                          totalCost: product.price,
                          deliveryDate: 'Add your delivery date here', // Replace with the delivery date
                          onPaymentSelected: (paymentMethod) {
                            // Handle payment selection here
                          },
                        ),
                      ),
                    );
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



