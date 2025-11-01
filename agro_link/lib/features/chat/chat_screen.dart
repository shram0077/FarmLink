import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago; // Import the timeago package
import '../../models/chat_message.dart';
import '../../models/expert.dart';
import '../../services/fake_data_service.dart';
import '../../l10n/app_localizations.dart';

class ChatScreen extends StatefulWidget {
  final Expert expert;

  const ChatScreen({super.key, required this.expert});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _loadMessages() {
    setState(() {
      // NOTE: Ensure your FakeDataService provides timestamps in the past for timeago to work correctly.
      _messages = FakeDataService.getChatMessagesForExpert(widget.expert.name);
      _messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    });

    // Scroll to bottom after loading messages
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final newMessage = FakeDataService.createNewMessage(
      message: _messageController.text.trim(),
      expertName: widget.expert.name,
      isFromExpert: false,
    );

    setState(() {
      _messages.add(newMessage);
    });

    _messageController.clear();
    _scrollToBottom();

    // Simulate expert response after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _simulateExpertResponse();
      }
    });
  }

  void _simulateExpertResponse() {
    final responses = [
      "Thank you for your question! Let me help you with that.",
      "That's a great question about agricultural practices.",
      "I understand your concern. Here's what I recommend...",
      "Based on your description, this is likely related to soil conditions.",
      "Have you considered trying organic methods for this issue?",
      "This is a common problem. Let me give you some specific solutions.",
    ];

    final randomResponse =
        responses[DateTime.now().millisecondsSinceEpoch % responses.length];

    final expertResponse = FakeDataService.createNewMessage(
      message: randomResponse,
      expertName: widget.expert.name,
      isFromExpert: true,
    );

    setState(() {
      _messages.add(expertResponse);
    });

    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Changed background to white
      body: SafeArea(
        // Use SafeArea to avoid system UI
        child: Column(
          children: [
            _buildHeader(), // New custom header
            Expanded(child: _buildMessagesList()),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  // New Header Widget
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(widget.expert.imageUrl),
            backgroundColor: Colors.grey[200],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)?.expertAdvise ?? 'Expert Advise',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)?.onlineNow ?? 'Online Now',
                  style: TextStyle(fontSize: 14, color: Colors.green),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black54, size: 28),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList() {
    return ListView.builder(
      reverse: false,
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[index];
        return _buildMessageBubble(message);
      },
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    final isUserMessage = !message.isFromExpert;

    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: isUserMessage
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                // UPDATED COLORS
                color: isUserMessage
                    ? const Color(0xFFFEEAE6) // Light Red/Pink for user
                    : const Color(0xFFE8F5E9), // Light Green for expert
                borderRadius: BorderRadius.circular(20),
                // REMOVED SHADOW
              ),
              child: Text(
                message.message,
                style: const TextStyle(
                  // UPDATED TEXT COLOR
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                // USE TIMEAGO FOR RELATIVE TIME
                timeago.format(message.timestamp),
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText:
                      AppLocalizations.of(context)?.typeMessage ??
                      'Type a message...',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF4CAF50), // Standard green send button
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: _sendMessage,
            ),
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
