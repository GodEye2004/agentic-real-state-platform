import 'package:flutter_application_1/featured/agent/provider/chat_notifier.dart';
import 'package:flutter_application_1/models/chatState/chat_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// DO THIS
final chatProvider =
    StateNotifierProvider<ChatNotifier, ChatState>((ref) => ChatNotifier());
