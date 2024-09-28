import 'package:flutter/material.dart';
import 'package:ppam_tugas2/datastore/user.dart';

class PageChats extends StatefulWidget {
  final User user;
  final String friend;

  const PageChats({
    super.key,
    required this.user,
    required this.friend,
  });

  @override
  State<PageChats> createState() => _PageChatsState();
}

class _PageChatsState extends State<PageChats> {
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.friend),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: widget.user.getConversation(widget.friend).length,
              itemBuilder: (context, index) {
                var conversation =
                    widget.user.getConversation(widget.friend)[index];

                return Row(
                  mainAxisAlignment:
                      conversation["from"] == widget.user.username
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: conversation["from"] == widget.user.username
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        conversation["message"] ?? "",
                        style: TextStyle(
                          color: conversation["from"] == widget.user.username
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.onSecondary,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: "Type a message",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    setState(() {
                      widget.user.pushMessage(
                        widget.friend,
                        _messageController.text,
                      );
                      _messageController.clear();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
