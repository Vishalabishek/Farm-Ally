import 'package:flutter/material.dart';

class DiseaseDetectionPage extends StatefulWidget {
  @override
  _DiseaseDetectionPageState createState() => _DiseaseDetectionPageState();
}

class _DiseaseDetectionPageState extends State<DiseaseDetectionPage> {
  String result = '';
  bool isDetecting = false;
  String imagePath = ''; // Placeholder for the selected image path

  void detectDisease() {
    setState(() {
      isDetecting = true;
    });
    // Simulating detection with a delay
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isDetecting = false;
        result = 'Detected: Leaf Rust';
      });
    });
  }

  // Method to pick an image from the gallery (simulated)
  void pickImage() {
    // Simulating image selection by setting a placeholder image path
    setState(() {
      imagePath = 'assets/plant.jpg'; // Replace with the path of 'plant.jpg'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disease Detection'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                pickImage(); // Trigger image selection
              },
              child: Text('Select Image'),
            ),
            SizedBox(height: 20),
            if (imagePath.isNotEmpty) // Display selected image if available
              Image.asset(
                imagePath,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              )
            else
              Text('No Image Selected'), // Placeholder for the selected image
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                detectDisease(); // Trigger disease detection
              },
              child: Text('Start Detection'),
            ),
            SizedBox(height: 20),
            isDetecting
                ? CircularProgressIndicator()
                : Text(
                    result.isNotEmpty ? result : 'No Disease Detected Yet',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
          ],
        ),
      ),
    );
  }
}



