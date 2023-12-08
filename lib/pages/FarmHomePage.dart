import 'package:flutter/material.dart';
import 'ProfilePage.dart';
import 'AddProductsPage.dart';
import 'DiseaseDetectionPage.dart';
import 'PlantingPage.dart';
import 'FarmallyLogin.dart';
import 'ExpertConsultationPage.dart';


class FarmHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('F A R M A L L Y'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: const Color.fromARGB(255, 178, 255, 89),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Welcome VISHAL !',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 71, 171, 74),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Explore and engage with Farmally:',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: 1.0,
              children: <Widget>[
                _buildMenuItem(context, 'Profile', Icons.account_circle, const Color.fromARGB(255, 71, 171, 74), ProfilePage(), 'assets/profile.jpg'),
                _buildMenuItem(context, 'Add Products', Icons.add_box, const Color.fromARGB(255, 71, 171, 74), AddProductsPage(), 'assets/cart.jpg'),
                _buildMenuItem(context, 'Disease Detection', Icons.warning, const Color.fromARGB(255, 71, 171, 74), DiseaseDetectionPage(), 'assets/backfarm.jpg'),
                _buildMenuItem(context, 'Planting', Icons.eco, const Color.fromARGB(255, 71, 171, 74), PlantingPage(), 'assets/vegetables.jpg'),
                _buildMenuItem(context, 'Expert Consultation', Icons.people,  const Color.fromARGB(255, 71, 171, 74), ExpertConsultationPage(), 'assets/profile.jpg')
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              accountName: Text('Vishal Abishek G'),
              accountEmail: Text('vishalabishek@student.yce.edu'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
            ),
            _buildDrawerItem(context, Icons.home, 'Home', FarmHomePage()),
            _buildDrawerItem(context, Icons.account_circle, 'Profile', ProfilePage()),
            _buildDrawerItem(context, Icons.add_box, 'Add Products', AddProductsPage()),
            _buildDrawerItem(context, Icons.warning, 'Disease Detection', DiseaseDetectionPage()),
            _buildDrawerItem(context, Icons.eco, 'Planting', PlantingPage()),
            _buildDrawerItem(context, Icons.people, 'Expert Consultation', ExpertConsultationPage()),
            Divider(),
            _buildDrawerItem(context, Icons.logout, 'Logout', FarmallyLogin()),
          ],
        ),
      ),
    );
  }

  ListTile _buildDrawerItem(BuildContext context, IconData icon, String label, Widget destinationPage) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(label, style: TextStyle(color: Colors.green)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
    );
  }

  Widget _buildMenuItem(BuildContext context, String label, IconData icon, Color color, Widget page, String imagePath) {
    return GestureDetector(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        } else {
          // Handle Logout logic here
        }
      },
      child: Card(
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 40,
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
