import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/models.dart';
import '../services/api_service.dart';
import '../config/theme.dart';
import '../widgets/chat/message_list.dart';
import '../widgets/chat/message_input.dart';
import '../widgets/chat/empty_chat_state.dart';
import '../widgets/common/check_item.dart';
import 'properties_list_screen.dart';
import 'add_property_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ApiService _apiService = ApiService();
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Message> _messages = [];
  bool _isLoading = false;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _initializeChat();
  }

  Future<void> _initializeChat() async {
    setState(() => _isLoading = true);

    try {
      final isHealthy = await _apiService.checkHealth();
      if (!isHealthy) {
        if (mounted) {
          _showConnectionDialog();
        }
        return;
      }

      await _sendMessage('سلام', isInitial: true);
    } catch (e) {
      if (mounted) {
        _showConnectionDialog();
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showConnectionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('خطا در اتصال', textDirection: TextDirection.rtl),
            const SizedBox(width: 8),
            const Icon(Icons.error_outline, color: AppTheme.errorColor),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'لطفا مطمئن شوید که:',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 12),
            const CheckItem(text: 'سرور پایتون در حال اجرا است'),
            const CheckItem(text: 'آدرس API صحیح است'),
            const CheckItem(text: 'اینترنت شما فعال است'),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'آدرس API فعلی:',
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _apiService.baseUrl,
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontFamily: 'monospace',
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() => _isLoading = false);
            },
            child: const Text('بستن'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _initializeChat();
            },
            child: const Text('تلاش مجدد'),
          ),
        ],
      ),
    );
  }

  Future<void> _sendMessage(String text, {bool isInitial = false}) async {
    if (text.trim().isEmpty && !isInitial) return;

    final userMessage = Message(
      id: const Uuid().v4(),
      content: text,
      isUser: true,
      timestamp: DateTime.now(),
    );

    if (!isInitial) {
      setState(() {
        _messages.add(userMessage);
        _messageController.clear();
        _isTyping = true;
      });
      _scrollToBottom();
    }

    try {
      final response = await _apiService.sendMessage(text);

      final assistantMessage = Message(
        id: const Uuid().v4(),
        content: response.response,
        isUser: false,
        timestamp: DateTime.now(),
        properties: response.recommendedProperties,
      );

      setState(() {
        _messages.add(assistantMessage);
        _isTyping = false;
      });

      _scrollToBottom();
    } catch (e) {
      setState(() => _isTyping = false);
      _showError('خطا در ارسال پیام');
    }
  }

  void _scrollToBottom() {
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

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
        ),
        backgroundColor: AppTheme.errorColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Future<void> _showMenu() async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            _buildMenuItem(
              icon: Icons.list,
              title: 'مشاهده تمام املاک',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PropertiesListScreen(),
                  ),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.add_business,
              title: 'ثبت آگهی رایگان',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddPropertyScreen(),
                  ),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.memory,
              title: 'مشاهده حافظه مکالمه',
              onTap: () async {
                Navigator.pop(context);
                final memory = await _apiService.getMemory();
                _showMemoryDialog(memory);
              },
            ),
            _buildMenuItem(
              icon: Icons.restart_alt,
              title: 'شروع مکالمه جدید',
              onTap: () async {
                Navigator.pop(context);
                await _restartConversation();
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppTheme.primaryColor),
      ),
      title: Text(
        title,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      onTap: onTap,
    );
  }

  Future<void> _restartConversation() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'شروع مکالمه جدید',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
        ),
        content: Text(
          'آیا مطمئن هستید؟ تمام حافظه مکالمه پاک خواهد شد.',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('خیر'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('بله'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _apiService.restartConversation();
      setState(() => _messages.clear());
      await _initializeChat();
    }
  }

  void _showMemoryDialog(Map<String, dynamic> memory) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          '🧠 حافظه مکالمه',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
        ),
        content: SingleChildScrollView(
          child: Text(
            memory['summary'] ?? 'حافظه‌ای موجود نیست',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('بستن'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'مشاور املاک هوشمند',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.home_work,
                color: AppTheme.primaryColor,
                size: 24,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: _showMenu),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _messages.isEmpty
                ? EmptyChatState(onQuickReplyTap: _sendMessage)
                : MessageList(
                    scrollController: _scrollController,
                    messages: _messages,
                    isTyping: _isTyping,
                  ),
          ),
          MessageInput(
            controller: _messageController,
            onSubmitted: _sendMessage,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
