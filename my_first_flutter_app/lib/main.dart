import 'package:flutter/material.dart';

// The list of students. Each student is a Map.
// 'isFavorite' tells us if the student is a favorite or not.
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
    'isFavorite': false,
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
    'isFavorite': false,
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
    'isFavorite': false,
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
    'isFavorite': false,
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
    'isFavorite': false,
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
    'isFavorite': false,
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
      home: const StudentListPage(),
    );
  }
}

// Flag 3 - We use a StatefulWidget so the screen can change (setState)
class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  // ---------------------------------------------------------
  // Flag 4 - FAVORITE
  // Turns favorite ON if it is OFF, and OFF if it is ON.
  // ---------------------------------------------------------
  void favoriteStudent(int index) {
    print('Favorite button pressed');

    // setState tells Flutter: "something changed, redraw the screen!"
    setState(() {
      if (students[index]['isFavorite'] == true) {
        students[index]['isFavorite'] = false;
      } else {
        students[index]['isFavorite'] = true;
      }
    });
  }

  // ---------------------------------------------------------
  // Flag 6 - EDIT
  // Opens a small pop-up (AlertDialog).
  // ---------------------------------------------------------
  void editStudent(int index) {
    print('Edit button pressed');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Student'),
          content: Text('Editing ' + students[index]['name']),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // closes the pop-up
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // ---------------------------------------------------------
  // Flag 5 - DELETE
  // Removes the student from the list.
  // ---------------------------------------------------------
  void deleteStudent(int index) {
    print('Delete button pressed');

    setState(() {
      students.removeAt(index);
    });
  }

  // ---------------------------------------------------------
  // Flag 2 - TAP THE CARD
  // Runs when you tap anywhere on the card.
  // ---------------------------------------------------------
  void tapCard(int index) {
    print('Card tapped');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You tapped ' + students[index]['name']),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  // ---------------------------------------------------------
  // This builds ONE student card.
  // 'index' is the position of the student in the list.
  // ---------------------------------------------------------
  Widget buildStudentCard(int index) {
    Map<String, dynamic> student = students[index];

    // Default look (not a favorite)
    Color cardColor = Colors.white;
    Color borderColor = Colors.blue;
    IconData starIcon = Icons.star_border;
    String favoriteLabel = '';

    // Favorite look
    if (student['isFavorite'] == true) {
      cardColor = Colors.yellow.shade100;
      borderColor = Colors.amber;
      starIcon = Icons.star;
      favoriteLabel = 'FAVORITE';
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      elevation: 8,
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: borderColor, width: 2),
      ),

      // Flag 2 - InkWell makes the whole card tappable with onTap
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          tapCard(index);
        },
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // FAVORITE LABEL (empty text if not a favorite)
              Text(
                favoriteLabel,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),

              // IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  student['image'],
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 15),

              // NAME
              Text(
                student['name'],
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
                '${student['course']} - ${student['year']} Year',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // AGE
              Text(
                'Age: ${student['age']}',
                style: const TextStyle(fontSize: 14),
              ),

              const SizedBox(height: 5),

              // HOBBY
              Text(
                'Hobby: ${student['hobby']}',
                style: const TextStyle(fontSize: 14),
              ),

              const SizedBox(height: 15),

              // ADDITIONAL INFORMATION
              Text(
                'Student ID: ${student['studentId']}',
                style: const TextStyle(fontSize: 13),
              ),

              const SizedBox(height: 2),

              Text(
                'Email: ${student['email']}',
                style: const TextStyle(fontSize: 13),
              ),

              const SizedBox(height: 2),

              Text(
                'Favorite Subject: ${student['favoriteSubject']}',
                style: const TextStyle(fontSize: 13),
              ),

              const SizedBox(height: 15),

              // Flag 1 - BUTTONS (each one uses onPressed)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // FAVORITE BUTTON
                  IconButton(
                    onPressed: () {
                      favoriteStudent(index);
                    },
                    icon: Icon(starIcon, color: Colors.amber, size: 32),
                  ),

                  // EDIT BUTTON
                  IconButton(
                    onPressed: () {
                      editStudent(index);
                    },
                    icon: const Icon(Icons.edit, color: Colors.blue, size: 28),
                  ),

                  // DELETE BUTTON
                  IconButton(
                    onPressed: () {
                      deleteStudent(index);
                    },
                    icon: const Icon(Icons.delete, color: Colors.red, size: 28),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      // If the list is empty, show a message
      body: students.isEmpty
          ? const Center(
              child: Text('No students found.', style: TextStyle(fontSize: 20)),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 15),
              itemCount: students.length,
              itemBuilder: (context, index) {
                return buildStudentCard(index);
              },
            ),
    );
  }
}
