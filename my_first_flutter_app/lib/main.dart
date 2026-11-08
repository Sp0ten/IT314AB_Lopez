import 'package:flutter/material.dart';

class Students {
  String name;
  String course;
  String yearLevel;
  int age;
  String hobby;
  String image;
  String studentId;
  String email;
  String favoriteSubject;

  Students(
    this.name,
    this.course,
    this.yearLevel,
    this.age,
    this.hobby,
    this.image,
    this.studentId,
    this.email,
    this.favoriteSubject,
  );
}

List<Map<String, dynamic>> students = [
  {
    'image': 'assets/Sheeesh.jpg',
    'name': 'Keith Francis G. Lopez',
    'course': 'BSIT',
    'year': 3,
    'age': 21,
    'hobby': 'Touching Grass',
    'studentId': '1006',
    'email': 'keithlopez@gmail.com',
    'favoriteSubject': 'Encoder',
  },
  {
    'image': 'assets/goodstudent.jpg',
    'name': 'John Doe',
    'course': 'BSIT',
    'year': 3,
    'age': 20,
    'hobby': 'Gaming',
    'studentId': '1007',
    'email': 'john3123@gmail.com',
    'favoriteSubject': 'Networking',
  },
  {
    'image': 'assets/squintzsasdasd.jpg',
    'name': 'Vin Squint',
    'course': 'BSIT',
    'year': 2,
    'age': 19,
    'hobby': 'Reading',
    'studentId': '1008',
    'email': 'Vinsquint15623@gmail.com',
    'favoriteSubject': 'Database',
  },
  {
    'image': 'assets/mrbrightside.jpg',
    'name': 'Kenell Ivankov',
    'course': 'BSIT',
    'year': 3,
    'age': 21,
    'hobby': 'Mangahoy',
    'studentId': '1009',
    'email': 'aaronPeel@gmail.com',
    'favoriteSubject': 'Web Development',
  },
  {
    'image': 'assets/Baititser.jpg',
    'name': 'Bai Reyes',
    'course': 'BSIT',
    'year': 2,
    'age': 20,
    'hobby': 'Drawing',
    'studentId': '1010',
    'email': 'sophiathefirst@gmail.com',
    'favoriteSubject': 'Programming',
  },
  {
    'image': 'assets/TUlalalangsakingkwarto.jpg',
    'name': 'Carl Garcia',
    'course': 'BSIT',
    'year': 3,
    'age': 21,
    'hobby': 'Coding',
    'studentId': '1011',
    'email': 'CarlGar@gmail.com',
    'favoriteSubject': 'Web Development',
  },
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student List',
      home: Scaffold(
        backgroundColor: Colors.lightBlue[50],

        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            'Student List',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Flag 6 - Empty Classroom
        body: students.isEmpty
            ? const Center(
                child: Text(
                  'No students found.',
                  style: TextStyle(fontSize: 20),
                ),
              )
            // Flag 3 and Flag 4 - ListView.builder
            : ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 15),
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return StudentCard(
                    image: student['image'],
                    name: student['name'],
                    course: student['course'],
                    yearLevel: student['year'],
                    age: student['age'],
                    hobby: student['hobby'],
                    studentId: student['studentId'],
                    email: student['email'],
                    favoriteSubject: student['favoriteSubject'],
                  );
                },
              ),
      ),
    );
  }
}

// REUSABLE STUDENT CARD
class StudentCard extends StatelessWidget {
  final String image;
  final String? name;
  final String? course;
  final int? yearLevel;
  final int? age;
  final String? hobby;
  final String? studentId;
  final String? email;
  final String? favoriteSubject;

  const StudentCard({
    super.key,
    required this.image,
    this.name,
    this.course,
    this.yearLevel,
    this.age,
    this.hobby,
    this.studentId,
    this.email,
    this.favoriteSubject,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
            // IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 15),

            // NAME
            Text(
              name ?? 'Name: Not provided',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 10),

            // COURSE & YEAR LEVEL
            Text(
              '${course ?? 'Course: Not provided'} - ${yearLevel ?? '?'} Year',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // AGE
            Text(
              'Age: ${age ?? 'Not provided'}',
              style: const TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 5),

            // HOBBY
            Text(
              'Hobby: ${hobby ?? 'Not provided'}',
              style: const TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 15),

            // Flag 5 - Additional information
            Text(
              'Student ID: ${studentId ?? 'Not provided'}',
              style: const TextStyle(fontSize: 13),
            ),

            const SizedBox(height: 2),

            Text(
              'Email: ${email ?? 'Not provided'}',
              style: const TextStyle(fontSize: 13),
            ),

            const SizedBox(height: 2),

            Text(
              'Favorite Subject: ${favoriteSubject ?? 'Not provided'}',
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
