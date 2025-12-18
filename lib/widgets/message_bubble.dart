import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/models.dart';
import '../config/theme.dart';
import 'property_card.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: message.isUser 
            ? CrossAxisAlignment.end 
            : CrossAxisAlignment.start,
        children: [
          // حباب پیام
          Row(
            mainAxisAlignment: message.isUser
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!message.isUser) _buildAvatar(context),
              const SizedBox(width: 8),
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                  ),
                  decoration: BoxDecoration(
                    color: message.isUser
                        ? AppTheme.userMessageBg
                        : AppTheme.assistantMessageBg,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20),
                      bottomLeft: Radius.circular(message.isUser ? 20 : 4),
                      bottomRight: Radius.circular(message.isUser ? 4 : 20),
                    ),
                    boxShadow: AppTheme.messageShadow,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // متن پیام
                      Text(
                        message.content,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: message.isUser
                              ? AppTheme.userMessageText
                              : AppTheme.assistantMessageText,
                          height: 1.5,
                        ),
                      ),
                      
                      // زمان
                      const SizedBox(height: 4),
                      Text(
                        _formatTime(message.timestamp),
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: message.isUser
                              ? AppTheme.userMessageText.withOpacity(0.7)
                              : AppTheme.textLight,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              if (message.isUser) _buildAvatar(context),
            ],
          ),
          
          // کارت‌های املاک (اگر وجود داشته باشند)
          if (message.properties != null && message.properties!.isNotEmpty)
            ..._buildPropertyCards(context),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(
      begin: 0.2,
      end: 0,
      duration: 300.ms,
      curve: Curves.easeOut,
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: message.isUser 
            ? AppTheme.primaryColor 
            : AppTheme.secondaryColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: (message.isUser 
                ? AppTheme.primaryColor 
                : AppTheme.secondaryColor).withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          message.isUser ? Icons.person : Icons.home_work,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  List<Widget> _buildPropertyCards(BuildContext context) {
    return message.properties!.map((property) {
      return Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: PropertyCard(property: property),
          ),
        ),
      );
    }).toList();
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inMinutes < 1) {
      return 'همین الان';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} دقیقه پیش';
    } else if (difference.inDays < 1) {
      return '${difference.inHours} ساعت پیش';
    } else {
      return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
    }
  }
}

// Typing Indicator Widget
class TypingIndicator extends StatelessWidget {
  const TypingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppTheme.secondaryColor,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.home_work,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppTheme.assistantMessageBg,
              borderRadius: BorderRadius.circular(20),
              boxShadow: AppTheme.messageShadow,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDot(0),
                const SizedBox(width: 4),
                _buildDot(1),
                const SizedBox(width: 4),
                _buildDot(2),
              ],
            ),
          ),
        ],
      ),
    ).animate(onPlay: (controller) => controller.repeat()).fadeIn();
  }

  Widget _buildDot(int index) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: AppTheme.textSecondary,
        shape: BoxShape.circle,
      ),
    ).animate(
      onPlay: (controller) => controller.repeat(),
    ).scale(
      delay: (index * 200).ms,
      duration: 600.ms,
      begin: const Offset(1, 1),
      end: const Offset(1.3, 1.3),
      curve: Curves.easeInOut,
    );
  }
}