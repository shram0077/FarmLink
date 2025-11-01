class ChatMessage {
  final String id;
  final String senderId;
  final String senderName;
  final String message;
  final DateTime timestamp;
  final bool isFromExpert;
  final MessageType type;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.message,
    required this.timestamp,
    required this.isFromExpert,
    this.type = MessageType.text,
  });

  // Create a copy of the message with optional new values
  ChatMessage copyWith({
    String? id,
    String? senderId,
    String? senderName,
    String? message,
    DateTime? timestamp,
    bool? isFromExpert,
    MessageType? type,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      isFromExpert: isFromExpert ?? this.isFromExpert,
      type: type ?? this.type,
    );
  }

  // Convert to JSON for potential API usage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'senderName': senderName,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'isFromExpert': isFromExpert,
      'type': type.toString(),
    };
  }

  // Create from JSON for potential API usage
  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'] ?? '',
      senderId: json['senderId'] ?? '',
      senderName: json['senderName'] ?? '',
      message: json['message'] ?? '',
      timestamp: DateTime.parse(
        json['timestamp'] ?? DateTime.now().toIso8601String(),
      ),
      isFromExpert: json['isFromExpert'] ?? false,
      type: MessageType.values.firstWhere(
        (e) => e.toString() == json['type'],
        orElse: () => MessageType.text,
      ),
    );
  }
}

enum MessageType { text, image, file }
