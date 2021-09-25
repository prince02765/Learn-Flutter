import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 3;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Learning"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "This is Demo Flutter app for Learning Day: $days",
            style: const TextStyle(
                fontSize: 20,
                color: Colors.indigo,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
