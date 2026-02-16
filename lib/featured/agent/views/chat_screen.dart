import 'package:flutter/material.dart';
import 'package:flutter_application_1/featured/agent/provider/agent_provider.dart';
import 'package:flutter_application_1/models/agentTalk/agent_talk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/// Provide a simple isUser getter for AgentTalkResponse so existing UI code compiles.
/// Adjust the implementation if you have a different field (e.g. role, sender) to detect user messages.
extension AgentTalkResponseExt on AgentTalkResponse {
  // If your model has a field like `role`, `sender` or similar, update this logic.
  bool get isUser => false;

  // Provide a `message` getter so UI code can read text; adjust to match your model fields
  // (e.g. `text`, `content`, `answer`) if available.
  String get message => toString();
}

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    ref.read(chatProvider.notifier).sendMessage(text);
    _controller.clear();

    // Scroll to bottom after short delay to ensure list updates
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Chat with Agent')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(8),
              itemCount: chatState.messages.length,
              itemBuilder: (context, index) {
                final msg = chatState.messages[index];
                final isUser = msg.isUser; // use flag from state
                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      msg.message,
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (chatState.isLoading)
            const LinearProgressIndicator(minHeight: 2),
          if (chatState.error != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                chatState.error!,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _send(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _send,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
