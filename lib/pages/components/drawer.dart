import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget drawer(context) {
  return Container(
    width: 300,
    color: Theme.of(context).primaryColor,
    child: Column(
      children: [
        ListTile(
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
          title: const Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const CircleAvatar(
          radius: 44,
        ),
        const SizedBox(height: 6),
        const Text(
          'Username',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Divider(
          color: Color.fromARGB(255, 45, 45, 45),
          height: 0.3,
        ),
        const ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
        ),
        const ListTile(
          leading: Icon(Icons.favorite_outline_rounded),
          title: Text('Favorite'),
        ),
        const ListTile(
          leading: Icon(Icons.newspaper_rounded),
          title: Text('News'),
        ),
        const ListTile(
          leading: Icon(Icons.help_outline_rounded),
          title: Text('Help'),
        ),
        const SizedBox(height: 10),
        const Divider(
          color: Color.fromARGB(255, 45, 45, 45),
          height: 0.3,
        ),
        const ListTile(
          leading: Icon(
            Icons.history_rounded,
          ),
          title: Text(
            'History',
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.notifications,
          ),
          title: Text(
            'Notification',
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.emoji_people_rounded,
          ),
          title: Text(
            'Invite a Friend',
          ),
        ),
        // ),
        const Spacer(),
        ListTile(
          onTap: () {
            // FirebaseAuth.instance.signOut();
          },
          leading: const Icon(
            Icons.logout,
          ),
          title: const Text(
            'Logout',
          ),
        )
      ],
    ),
  );
}
