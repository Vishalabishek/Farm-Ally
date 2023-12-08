import 'package:flutter/material.dart';
import 'FruitsPage.dart';
import 'VegetablePage.dart';
import 'DairyProductsPage.dart';
import 'GrainsPage.dart';
import 'FarmallyLogin.dart';
import 'CartPage.dart';

class FarmallyHomePage extends StatelessWidget {
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
              'Explore and shop for fresh farm products:',
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
                _buildMenuItem(context, 'Fruits', Icons.shopping_basket, const Color.fromARGB(255, 71, 171, 74), FruitsPage(), 'assets/fruits.jpg'),
                _buildMenuItem(context, 'Vegetables', Icons.local_florist, const Color.fromARGB(255, 71, 171, 74), VegetablesPage(), 'assets/vegetables.jpg'),
                _buildMenuItem(context, 'Dairy Products', Icons.local_dining, const Color.fromARGB(255, 71, 171, 74), DairyProductsPage(), 'assets/dairy.jpg'),
                _buildMenuItem(context, 'Grains', Icons.grain, const Color.fromARGB(255, 71, 171, 74), GrainsPage(), 'assets/grains.jpg'),
                _buildMenuItem(context, 'Cart', Icons.trolley,  const Color.fromARGB(255, 71, 171, 74), CartPage(), 'assets/cart.jpg')
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
            _buildDrawerItem(context, Icons.home, 'Home', FarmallyHomePage()),
            _buildDrawerItem(context, Icons.shopping_basket, 'Fruits', FruitsPage()),
            _buildDrawerItem(context, Icons.local_florist, 'Vegetables', VegetablesPage()),
            _buildDrawerItem(context, Icons.add_box, 'Dairy Products', DairyProductsPage()),
            _buildDrawerItem(context, Icons.grain, 'Grains', GrainsPage()),
            _buildDrawerItem(context, Icons.trolley, 'Cart', CartPage()),
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
                fontSize: 20, // Set the font size to 20
                fontWeight: FontWeight.bold, // Set the font weight to bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
