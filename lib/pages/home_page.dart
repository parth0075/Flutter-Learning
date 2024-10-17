import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    const days = 30;
    return Scaffold(
      appBar: AppBar(
        title: Text("First Demo Apps!"),
      ),
      body: Center(
        child: Text("Welcome to $days days of flutters"),
      ),
      drawer: Drawer(),
    );
  }
}
