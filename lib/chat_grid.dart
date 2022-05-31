import 'package:flutter/material.dart';

class ChatGrid extends StatelessWidget {
  final dynamic chats;

  const ChatGrid({
    Key? key,
    required this.chats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Image.asset(
            chats.image!,
            width: 100,
            height: 100,
            fit: BoxFit.fill,
          ),
        ),
        title: Text(
          chats.names!,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: Text(chats.time!),
      ),
    );
  }
}
