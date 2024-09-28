import 'package:flutter/material.dart';
import 'package:ppam_tugas2/datastore/user.dart';
import 'package:ppam_tugas2/pages/page_chats.dart';
import 'package:ppam_tugas2/pages/page_login.dart';

class PageFriends extends StatefulWidget {
  final User user;

  const PageFriends({
    super.key,
    required this.user,
  });

  @override
  State<PageFriends> createState() => _PageFriendsState();
}

class _PageFriendsState extends State<PageFriends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teman - ${widget.user.username}"),
        leading: Icon(
          Icons.message,
          color: Theme.of(context).colorScheme.primary,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PageLogin(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: widget.user.getFriendList().length,
        itemBuilder: (context, index) {
          var friendUsername = widget.user.getFriendList()[index];

          return ListTile(
            title: Text(
              friendUsername,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              "Teman",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            onTap: () {
              // MARK: push & passing data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageChats(
                    user: widget.user,
                    friend: friendUsername,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
