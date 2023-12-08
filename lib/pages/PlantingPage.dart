import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlantingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planting'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Plant Type:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  _buildPlantItem('Tomato', 'assets/tomato.jpg', context),
                  _buildPlantItem('Carrot', 'assets/carrot.jpg', context),
                  _buildPlantItem('Onion', 'assets/onion.jpg', context),
                  _buildPlantItem('Rice', 'assets/rice.jpg', context),
                  // Add more plant items as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlantItem(String name, String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlantDetailsPage(plantName: name, imagePath: imagePath),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 50,
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlantDetailsPage extends StatelessWidget {
  final String plantName;
  final String imagePath;

  PlantDetailsPage({required this.plantName, required this.imagePath});

  String calculateWateringDate() {
    // Calculate next watering date (7 days from today)
    DateTime nextWateringDate = DateTime.now().add(Duration(days: 7));
    return 'Next watering date: ${DateFormat('MMM d, yyyy').format(nextWateringDate)}';
  }

  String calculatePesticidesDate() {
    // Calculate pesticides schedule (14 days from today)
    DateTime pesticidesDate = DateTime.now().add(Duration(days: 14));
    return 'Pesticides schedule: ${DateFormat('MMM d, yyyy').format(pesticidesDate)}';
  }

  String calculateHarvestDate() {
    // Calculate estimated harvest date (90 days from today)
    DateTime harvestDate = DateTime.now().add(Duration(days: 90));
    return 'Estimated harvest date: ${DateFormat('MMM d, yyyy').format(harvestDate)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Details'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 50,
            ),
            SizedBox(height: 20),
            Text(
              plantName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              calculateWateringDate(),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              calculatePesticidesDate(),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              calculateHarvestDate(),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Important Facts:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Provide ample sunlight and water regularly for healthy growth.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}


