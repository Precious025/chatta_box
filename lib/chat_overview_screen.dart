import 'package:chattabox/bottom_navigator.dart';
import 'package:chattabox/chat_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/chat_bloc.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static const routeName = '/chat';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          switch (state.status) {
            case ChatStatus.failure:
              return const Center(child: Text('failed to fetch posts'));
            case ChatStatus.success:
              if (state.chats.isEmpty) {
                return const Center(child: Text('no posts'));
              }
              return SafeArea(
                  minimum: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.menu),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Chats',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.local_phone_outlined),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ]),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 1),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintStyle: const TextStyle(
                                  color: Color.fromRGBO(151, 151, 151, 1)),
                              fillColor:
                                  const Color.fromARGB(255, 214, 214, 214),
                              filled: true,
                              hintText: 'Search for chats',
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.filter_alt_outlined,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  )),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'New group',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.add),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ]),
                      ),
                      Expanded(
                        child: ListView.separated(
                            itemCount: state.chats.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Divider(height: 1),
                                    ),
                            itemBuilder: (context, int index) {
                              return ChatGrid(chats: state.chats[index]);
                            }),
                      ),
                    ],
                  ));
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
