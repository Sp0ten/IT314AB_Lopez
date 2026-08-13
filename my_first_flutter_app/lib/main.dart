import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String name = 'Keith Francis G. Lopez';
  final String courseSection = 'BSIT-3';
  final int age = 21;
  final String hobby = 'Touching Grass';
  final double height = 170.0;
  final bool isStudent = true;
  final String profileImage = 'assets/smolder.jpg';

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

        // ScrollView
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // YOUR PROFILE
                ProfileCard(
                  image: profileImage,
                  name: name,
                  courseSection: courseSection,
                  age: age,
                  hobby: hobby,
                  birthdate: 'September 25, 2004',
                ),

                const SizedBox(height: 15),

                // FAVORITES
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

                const SizedBox(height: 15),

                // PROFILE 2
                ProfileCard(
                  image: 'assets/2in1.jpg',
                  name: 'John Doe',
                  courseSection: 'BSIT-3',
                  age: 20,
                  hobby: 'Playing Online Games',
                ),

                const SizedBox(height: 15),

                // PROFILE 3
                ProfileCard(
                  image: 'assets/SleepingBeuty.jpg',
                  name: 'Vin Slash',
                  courseSection: 'BSIT-3',
                  age: 21,
                  hobby: 'Sleeping',
                ),

                const SizedBox(height: 15),

                // PROFILE 4
                ProfileCard(
                  image: 'assets/Cutie.jpg',
                  name: 'Kenwell Ivankov',
                  courseSection: 'BSIT-3',
                  age: 22,
                  hobby: 'Being Cute',
                ),

                const SizedBox(height: 15),

                // PROFILE 5
                ProfileCard(
                  image: 'assets/nasarapan.jpg',
                  name: 'Carl Garcia',
                  courseSection: 'BSIT-3',
                  age: 20,
                  hobby: 'Coding and Inlab',
                ),

                const SizedBox(height: 15),

                // INCOMPLETE PROFILE A
                ProfileCard(
                  image: 'assets/smolder.jpg',
                  name: 'Maria',
                  courseSection: 'BSIT',
                  age: null,
                  hobby: null,
                ),

                const SizedBox(height: 15),

                // INCOMPLETE PROFILE B
                ProfileCard(
                  image: 'assets/2in1.jpg',
                  name: 'Juan',
                  courseSection: null,
                  age: 20,
                  hobby: 'Gaming',
                ),

                const SizedBox(height: 15),

                // INCOMPLETE PROFILE C
                ProfileCard(
                  image: 'assets/Cutie.jpg',
                  name: null,
                  courseSection: 'MMA',
                  age: 22,
                  hobby: 'Drawing',
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// REUSABLE PROFILE CARD
class ProfileCard extends StatelessWidget {
  final String image;
  final String? name;
  final String? courseSection;
  final int? age;
  final String? hobby;
  final String? birthdate;

  const ProfileCard({
    super.key,
    required this.image,
    this.name,
    this.courseSection,
    this.age,
    this.hobby,
    this.birthdate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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

            // IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 15),

            // NAME
            Text(
              name ?? 'Name: Not provided',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 15),

            // COURSE & SECTION
            Text(
              courseSection ?? 'Course: Not provided',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // AGE
            Text(
              'Age: ${age ?? 'Not provided'}',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),

            // BIRTHDATE
            if (birthdate != null) ...[
              const SizedBox(height: 10),

              Text(
                'Birthdate: $birthdate',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],

            const SizedBox(height: 15),

            // HOBBY
            Text(
              'Hobby: ${hobby ?? 'Not provided'}',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}