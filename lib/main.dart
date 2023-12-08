import 'package:farmallydt/pages/FarmallyLogin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FarmallyLogin(),
  ));
}

/*import 'package:flutter/material.dart';
import 'package:farmallydt/pages/FarmallyHomePage.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmally Login',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmally Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Logic to handle customer login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FarmallyHomePage()),
                );
              },
              child: Text('Customer Login'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Logic to handle farmer login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FarmerHomePage()),
                );
              },
              child: Text('Farmer Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Home'),
      ),
      body: Center(
        child: Text('Welcome, Customer!'),
      ),
    );
  }
}

class FarmerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmer Home'),
      ),
      body: Center(
        child: Text('Welcome, Farmer!'),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:farmallydt/pages/FarmAllyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Farmally',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FarmallyHomePage(), // Set FarmallyHomePage as the initial route
    );
  }
}
*/
