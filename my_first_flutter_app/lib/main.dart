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
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // Profile Card
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(25),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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

                        const SizedBox(height: 15),

                        const Text(
                          'BSIT 3',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),

                        const Text(
                          'My First Flutter Application',
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Colors.green,
                          ),
                        ),

                        const SizedBox(height: 15),

                        const Text(
                          'August 11, 2026',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 15),

                        const Text(
                          'Hobby: Touching Grass',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 15),

                        const Divider(),

                        const SizedBox(height: 15),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Age: 21',
                              style: TextStyle(fontSize: 15),
                            ),

                            SizedBox(width: 30),

                            Text(
                              'Birthdate: September 25, 2004',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // SPACE BETWEEN CARDS
                const SizedBox(height: 5),

                // Favorite Card
                Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(20),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'My Favorites',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),

                        const Text(
                          'Favorite Game: Dota',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),

                        const SizedBox(height: 2),

                        const Text(
                          'Favorite Food: Pizza and Burgir',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),

                        const SizedBox(height: 2),

                        const Text(
                          'Favorite Movie: Spider-Man',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),

                        const SizedBox(height: 2),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Favorite Color: Black',
                              style: TextStyle(fontSize: 13),
                            ),

                            SizedBox(width: 13),

                            Text(
                              'Favorite Sport: Chess',
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}