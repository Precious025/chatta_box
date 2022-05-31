import 'package:chattabox/chat_overview_screen.dart';
import 'package:chattabox/contacts.dart';
import 'package:chattabox/status.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  static const routeName = '/bottom';
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int pageIndex = 0;

  void _onItemTapped(int index) {
    return setState(() {
      pageIndex = index;
    });
  }

  final _pages = [
    const Contacts(),
    const ChatScreen(),
    const Status(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[pageIndex],
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(33, 122, 157, 1),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.group_outlined),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.textsms_outlined),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.filter_tilt_shift_rounded),
              label: 'Story',
            ),
          ],
          currentIndex: pageIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
