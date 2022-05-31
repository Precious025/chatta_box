import 'package:chattabox/chat.dart';
import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  final List<Chat> chats = [
    Chat(
      id: 1,
      names: 'Jack',
      time: '4:00',
      image: 'assets/images/Ellipse 14.png',
    ),
    Chat(
      id: 2,
      names: 'Zanny',
      time: '5:00',
      image: 'assets/images/Ellipse 2.png',
    ),
    Chat(
      id: 3,
      names: 'Bamtick Guy',
      time: '6:00',
      image: 'assets/images/Ellipse 3.png',
    ),
    Chat(
      id: 4,
      names: 'Greg',
      time: '5:00',
      image: 'assets/images/Ellipse 4.png',
    ),
    Chat(
      id: 5,
      names: 'Hustler',
      time: '5:00',
      image: 'assets/images/Ellipse 5.png',
    ),
    Chat(
      id: 6,
      names: 'Zanny',
      time: '5:00',
      image: 'assets/images/Ellipse 6.png',
    ),
  ];

  @override
  List<Object?> get props => [];
}
