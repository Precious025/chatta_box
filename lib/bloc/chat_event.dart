part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class LoadChat extends ChatEvent {
  final List<Chat> chats;

  const LoadChat({this.chats = const <Chat>[]});
}
