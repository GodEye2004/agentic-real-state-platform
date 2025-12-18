import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../message_bubble.dart';

class MessageList extends StatelessWidget {
  final ScrollController scrollController;
  final List<Message> messages;
  final bool isTyping;

  const MessageList({
    Key? key,
    required this.scrollController,
    required this.messages,
    required this.isTyping,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: messages.length + (isTyping ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == messages.length && isTyping) {
          return const TypingIndicator();
        }
        return MessageBubble(message: messages[index]);
      },
    );
  }
}
