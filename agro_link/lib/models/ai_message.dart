class AIMessage {
  final String id;
  final String message;
  final DateTime timestamp;
  final bool isFromAI;
  final String? aiResponse;

  const AIMessage({
    required this.id,
    required this.message,
    required this.timestamp,
    required this.isFromAI,
    this.aiResponse,
  });

  factory AIMessage.fromJson(Map<String, dynamic> json) {
    return AIMessage(
      id: json['id'] ?? '',
      message: json['message'] ?? '',
      timestamp: DateTime.parse(
        json['timestamp'] ?? DateTime.now().toIso8601String(),
      ),
      isFromAI: json['isFromAI'] ?? false,
      aiResponse: json['aiResponse'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'isFromAI': isFromAI,
      'aiResponse': aiResponse,
    };
  }
}
