import 'package:flutter_application_1/config/api/api_service.dart';
import 'package:flutter_application_1/models/agentTalk/agent_talk.dart';
import 'package:flutter_application_1/models/chatState/chat_state.dart';

import 'package:state_notifier/state_notifier.dart';

class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier() : super(const ChatState());

  final _api = ApiService();

  Future<void> sendMessage(String message) async {
    // add user message
    state = state.copyWith(
      messages: [
        ...state.messages,
        AgentTalkResponse(response: message, sessionId: '', state: 'user'),
      ],
    );

    // get bot response
    state = state.copyWith(
      messages: [...state.messages],
      isLoading: true,
      error: null,
    );
    try {
      final reply = await _api.talkToAgent(message);
      state = state.copyWith(
        messages: [...state.messages, reply],
        isLoading: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
