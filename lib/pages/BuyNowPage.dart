import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BuyNowPage extends StatelessWidget {
  final double totalCost;
  final int estimatedDays;
  final String paymentMethod;

  BuyNowPage({
    required this.totalCost,
    required this.estimatedDays,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Now'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Cost: \₹$totalCost',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Estimated Days to Deliver: $estimatedDays days',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Selected Payment Method: $paymentMethod',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Payment Options:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _showSuccessMessage(context, 'Pay on Delivery');
              },
              child: Text('Pay on Delivery'),
            ),
            ElevatedButton(
              onPressed: () {
                _showSuccessMessage(context, 'Card Payment');
              },
              child: Text('Card Payment'),
            ),
            ElevatedButton(
              onPressed: () {
                _showSuccessMessage(context, 'UPI Payment');
              },
              child: Text('UPI Payment'),
            ),
            SizedBox(height: 20),
            Expanded(
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showSuccessMessage(context, 'Order Tracked on Map');
              },
              child: Text('Track Your Order'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessMessage(BuildContext context, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Success: $action'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}



