import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SocialScreen(),
    );
  }
}

class Friend {
  String name;
  String status;
  String? game;
  String? avatarPath;

  Friend({
    required this.name,
    required this.status,
    this.game,
    this.avatarPath,
  });
}

class Conversation {
  String name;
  String message;
  String time;
  bool unread;
  bool online;

  Conversation({
    required this.name,
    required this.message,
    required this.time,
    required this.unread,
    required this.online,
  });
}

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  List<Friend> valorantFriends = [
    Friend(name: 'MissYouLikeKrazy', status: 'online', game: 'VALORANT'),
    Friend(name: 'bread', status: 'playing', game: 'VALORANT'),
    Friend(name: 'The14th', status: 'playing', game: 'VALORANT'),
  ];

  List<Friend> onlineFriends = [
    Friend(name: 'Carlvendish', status: 'away', game: 'Riot Mobile'),
    Friend(name: 'D1yah', status: 'away'),
  ];

  List<Conversation> conversations = [
    Conversation(
      name: 'MissYouLikeKrazy',
      message: 'Hey, are you playing later?',
      time: '2:30 PM',
      unread: true,
      online: true,
    ),

    Conversation(
      name: '',
      message: '',
      time: 'Yesterday',
      unread: true,
      online: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F10),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Social',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: const [
                  Text('Friends', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 20),
                  Text(
                    'Messages',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text('Requests', style: TextStyle(color: Colors.grey)),
                ],
              ),

              const SizedBox(height: 12),

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
                    SizedBox(width: 12),
                    Text('Search', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Inbox',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView.builder(
                  itemCount: conversations.length,
                  itemBuilder: (context, index) {
                    Conversation conversation = conversations[index];

                    String name = conversation.name;

                    if (name.isEmpty) {
                      name = 'Unknown User';
                    }

                    String message = conversation.message;

                    if (message.isEmpty) {
                      message = 'No message available.';
                    }

                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 6),
                      leading: Stack(
                        children: [
                          const CircleAvatar(
                            radius: 24,
                            backgroundColor: Color(0xFF2B2B2E),
                            child: Icon(Icons.person, color: Colors.white54),
                          ),

                          if (conversation.online)
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFF0F0F10),
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),

                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: conversation.unread
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),

                          Text(
                            conversation.time,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      subtitle: Row(
                        children: [
                          Expanded(
                            child: Text(
                              message,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: conversation.unread
                                    ? Colors.white70
                                    : Colors.grey,
                              ),
                            ),
                          ),

                          if (conversation.unread)
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),

                      onTap: () {
                        setState(() {
                          conversation.unread = false;
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
