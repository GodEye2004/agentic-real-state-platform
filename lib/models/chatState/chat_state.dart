import 'package:flutter_application_1/models/agentTalk/agent_talk.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<AgentTalkResponse> messages,
    @Default(false) bool isLoading,
    String? error,
  }) = _ChatState;
  
  @override
  // TODO: implement error
  String? get error => throw UnimplementedError();
  
  @override
  // TODO: implement isLoading
  bool get isLoading => throw UnimplementedError();
  
  @override
  // TODO: implement messages
  List<AgentTalkResponse> get messages => throw UnimplementedError();
  

}
