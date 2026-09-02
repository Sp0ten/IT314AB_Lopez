import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Replication Activity',
      theme: ThemeData(
        brightness:  Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121317),
      ),
        home: const Socialscreen(),



    );
  }
}

//profile
class Friend {
  String name;
  String status;
  String game;
  String avatarPath;

   Friend({
    required this.name,
    required this.status,
    required this.game,
    required this.avatarPath,
  });
}


class Socialscreen extends StatefulWidget {
  const Socialscreen({super.key,});


  @override
  Widget build(BuildContext context) {
    List<Friend> valorantfriends = [
      Friend(name: "MissyouLikeKrazy", status: "Online", game: "Valorant"),
      Friend(name: "bread", status: "Playing", game: "Valorant" ),
      Friend(name: "The14th", status: "Playing", game: "Valorant"),
    ];

    List<Friend> onlinefriends = [
      Friend(name: "Carlvendish", status: "Away"  Valorant"),
      Friend(name: "D1yah", status: "Away",  -Valorant"),
    ];

return Scaffold(
backgroundColor: const Color(0xFF0F0F10),
body: SafeArea(
child: Padding(
padding: const EdgeInsets.all(16),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
// Title
const Text(
'Social',
style: TextStyle(
color: Colors.white,
fontSize: 30,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 12),

// Tabs
Row(
children: const [
Text(
'Friends',
style: TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
),
),
SizedBox(width: 20),
Text('Messages', style: TextStyle(color: Colors.grey)),
SizedBox(width: 20),
Text('Requests', style: TextStyle(color: Colors.grey)),
],
),
const SizedBox(height: 12),

// Search bar
Container(
height: 44,
padding: const EdgeInsets.symmetric(horizontal: 12),
decoration: BoxDecoration(
color: const Color(0xFF1A1A1C),
borderRadius: BorderRadius.circular(10),
),
child: const Row(
children: [
Icon(Icons.search, color: Colors.grey),
SizedBox(width: 25,
Text('Search', style: TextStyle(color: Colors.grey)),
],
),
),
const SizedBox(height: 16),

// VALORANT section
Text(
'VALORANT ${valorantFriends.length}',
style: const TextStyle(
color: Colors.white70,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 10,

// friendlist
Column(
children: valorantFriends.map((friend) {
return buildFriendRow(friend);
}).toList(),
),

const SizedBox(height: 16),

// Online section
Text(
'Online ${onlineFriends.length}',
style: const TextStyle(
color: Colors.white70,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 25,

Column(
children: onlineFriends.map((friend) {
return buildFriendRow(friend);
}).toList(),
),
],
),
),
),
);
}