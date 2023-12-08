import 'package:flutter/material.dart';
import 'BuyNowPage.dart';

class GrainsPage extends StatelessWidget {
  final List<Product> grains = [
    Product('Rice', 'A staple food for many cultures.', 'assets/rice.jpg', 50.0),
    Product('Wheat Flour', 'Used to make various dishes and bread.', 'assets/wheat_flour.jpg', 40.0),
    Product('Dal', 'High in protein and essential nutrients.', 'assets/dal.jpg', 60.0),
    Product('Oats', 'Rich in antioxidants and nutrients.', 'assets/oats.jpg', 35.0),
    Product('Barley', 'Used in soups, stews, and salads.', 'assets/barley.jpg', 60.0),
    Product('Millet', 'Gluten-free and versatile grain.', 'assets/millet.jpg', 45.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grains'),
        backgroundColor: const Color.fromARGB(255, 71, 171, 74),
      ),
      backgroundColor: Color.fromARGB(255, 128, 230, 131),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: grains.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _showProductDetails(context, grains[index]);
            },
            child: _buildGrainItem(grains[index], context),
          );
        },
      ),
    );
  }

  Widget _buildGrainItem(Product product, BuildContext context) {
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
                      _addToCart(product);
                      Navigator.of(context).pop();
                    },
                    child: Text('Add to Cart'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showBuyNowDialog(context, product);
                      Navigator.of(context).pop();
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

  void _addToCart(Product product) {
    // Implement adding the product to the cart
  }

  void _showBuyNowDialog(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Buy Now'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Cost: \₹${product.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                'Estimated Days to Deliver: 3 days',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                'Payment Options:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              // Implement payment options UI (Pay on Delivery, Card, UPI, etc.)
              ElevatedButton(
                onPressed: () {
                  _buyNow(context, product, 'Pay on Delivery');
                  Navigator.of(context).pop();
                },
                child: Text('Pay on Delivery'),
              ),
              ElevatedButton(
                onPressed: () {
                  _buyNow(context, product, 'Card Payment');
                  Navigator.of(context).pop();
                },
                child: Text('Card Payment'),
              ),
              ElevatedButton(
                onPressed: () {
                  _buyNow(context, product, 'UPI Payment');
                  Navigator.of(context).pop();
                },
                child: Text('UPI Payment'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _buyNow(BuildContext context, Product product, String paymentMethod) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BuyNowPage(
          totalCost: product.price,
          estimatedDays: 3,
          paymentMethod: paymentMethod,
        ),
      ),
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





