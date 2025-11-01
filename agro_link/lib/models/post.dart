class Post {
  final String id;
  final String title;
  final String content;
  final String category;
  final List<String> tags;
  final String authorName;
  final String authorImageUrl;
  final DateTime timestamp;
  final int likesCount;
  final int commentsCount;
  final bool isLikedByCurrentUser;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.tags,
    required this.authorName,
    required this.authorImageUrl,
    required this.timestamp,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.isLikedByCurrentUser = false,
  });

  // Create a copy of the post with optional new values
  Post copyWith({
    String? id,
    String? title,
    String? content,
    String? category,
    List<String>? tags,
    String? authorName,
    String? authorImageUrl,
    DateTime? timestamp,
    int? likesCount,
    int? commentsCount,
    bool? isLikedByCurrentUser,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      tags: tags ?? this.tags,
      authorName: authorName ?? this.authorName,
      authorImageUrl: authorImageUrl ?? this.authorImageUrl,
      timestamp: timestamp ?? this.timestamp,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      isLikedByCurrentUser: isLikedByCurrentUser ?? this.isLikedByCurrentUser,
    );
  }

  // Convert to JSON for potential API usage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'category': category,
      'tags': tags,
      'authorName': authorName,
      'authorImageUrl': authorImageUrl,
      'timestamp': timestamp.toIso8601String(),
      'likesCount': likesCount,
      'commentsCount': commentsCount,
      'isLikedByCurrentUser': isLikedByCurrentUser,
    };
  }

  // Create from JSON for potential API usage
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      category: json['category'] ?? 'General',
      tags: List<String>.from(json['tags'] ?? []),
      authorName: json['authorName'] ?? '',
      authorImageUrl: json['authorImageUrl'] ?? '',
      timestamp: DateTime.parse(
        json['timestamp'] ?? DateTime.now().toIso8601String(),
      ),
      likesCount: json['likesCount'] ?? 0,
      commentsCount: json['commentsCount'] ?? 0,
      isLikedByCurrentUser: json['isLikedByCurrentUser'] ?? false,
    );
  }
}
