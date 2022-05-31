import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

import '../chat.dart';
import '../chat_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';

const throttleDuration = Duration(milliseconds: 100);
final List<Chat> chatProvider = ChatModel().chats;

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({this.chats}) : super(const ChatState()) {
    on<LoadChat>(
      _onPostFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final Chat? chats;

  Future<void> _onPostFetched(
    LoadChat event,
    Emitter<ChatState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == ChatStatus.initial) {
        final chats = _fetchChats();
        return emit(state.copyWith(
          status: ChatStatus.success,
          chats: chats,
          hasReachedMax: false,
        ));
      }
      final chats = _fetchChats(state.chats.length);
      chats.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: ChatStatus.success,
                chats: List.of(state.chats)..addAll(chats),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: ChatStatus.failure));
    }
  }

  List<Chat> _fetchChats([int startIndex = 0]) {
    return chatProvider;
  }
}
