import 'package:covid_19_app/update_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'instructions_page.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 20,
        toolbarHeight: 70,
        backgroundColor: Colors.blue[100],
        title: Text(
          'Covid 19',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: HomePage(),
    );
  }
}
