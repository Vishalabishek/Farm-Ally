import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CartPage extends StatelessWidget {
  final List<String> cartItems = [
    'Product 1',
    'Product 2',
    'Product 3',
    'Product 4',
    'Product 5',
    'Product 6',
  ]; // Replace with your actual cart items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          return CartItemWidget(cartItems[index]);
        },
        padding: EdgeInsets.all(8.0),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \₹150.00', // Replace with actual total calculation
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => CheckOutPage(
      totalCost: 150.00, // Replace with your total cost
      deliveryDate: 'January 1, 2023', // Replace with your delivery date
      onPaymentSelected: (paymentMethod) {
        // Handle the payment selection here
      },
    ),
  ),
);
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final String itemName;

  CartItemWidget(this.itemName);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/product_image.jpg'), // Replace with actual image
              radius: 40,
            ),
            SizedBox(height: 8.0),
            ListTile(
              title: Text(
                itemName,
                textAlign: TextAlign.center,
              ),
              trailing: Text(
                '\₹25.0      ', // Replace with actual price for each item
                textAlign: TextAlign.center,
              ),
              // Add more information about the item as needed
            ),
          ],
        ),
      ),
    );
  }
}

class CheckOutPage extends StatelessWidget {
  final double totalCost;
  final String deliveryDate;
  final Function(String) onPaymentSelected;

  CheckOutPage({
    required this.totalCost,
    required this.deliveryDate,
    required this.onPaymentSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Total Cost: \₹$totalCost',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Delivery Date: $deliveryDate',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Payment Method:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                buildPaymentButton('Pay on Delivery', Icons.attach_money),
                SizedBox(height: 10),
                buildPaymentButton('UPI', Icons.payment),
                SizedBox(height: 10),
                buildPaymentButton('Card', Icons.credit_card),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.hardEdge,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(37.42796133580664, -122.085749655962),
                    zoom: 14,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(37.42796133580664, -122.085749655962),
                      infoWindow: InfoWindow(title: 'Your order is here'),
                    ),
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement action to track order on map
              },
              child: Text('Track Your Order'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentButton(String label, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {
        onPaymentSelected(label);
      },
      icon: Icon(icon),
      label: Text(label),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}


/*class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Center(
        child: Text('Checkout Page'), // Implement your checkout UI here
      ),
    );
  }
}*/












