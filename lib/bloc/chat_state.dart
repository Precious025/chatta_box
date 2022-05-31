part of 'chat_bloc.dart';

enum ChatStatus { initial, success, failure }

class ChatState extends Equatable {
  const ChatState({
    this.status = ChatStatus.initial,
    this.chats = const <Chat>[],
    this.hasReachedMax = false,
  });

  final ChatStatus status;
  final List<Chat> chats;
  final bool hasReachedMax;

  ChatState copyWith({
    ChatStatus? status,
    List<Chat>? chats,
    bool? hasReachedMax,
  }) {
    return ChatState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${chats.length} }''';
  }

  @override
  List<Object> get props => [status, chats, hasReachedMax];
}
