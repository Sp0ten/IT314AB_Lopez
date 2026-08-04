import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My First Flutter Application',

      home: Scaffold(
        backgroundColor: Colors.lightBlue[50],

        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            'My First Flutter Application',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),

        body: Center(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Colors.blue, width: 2),
            ),

            child: Padding(
              padding: const EdgeInsets.all(25),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Flag 12: Display image from assets
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/lopesh.jfif',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Keith Francis Lopez',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'BSIT 3',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'My First Flutter Application',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'August 4, 2026',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
