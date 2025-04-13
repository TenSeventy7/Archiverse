import 'package:archiverse/models/user.dart';

class Comment {
  final int id;
  final User user;
  final String content;
  final DateTime date;
  final int? parentId;

  Comment({
    required this.id,
    required this.user,
    required this.content,
    required this.date,
    this.parentId,
  });

  Comment copyWith({
    int? id,
    User? user,
    String? content,
    DateTime? date,
    int? parentId,
  }) {
    return Comment(
      id: id ?? this.id,
      user: user ?? this.user,
      content: content ?? this.content,
      date: date ?? this.date,
      parentId: parentId ?? this.parentId,
    );
  }

  bool get isReply => parentId != null;

  @override
  String toString() {
    return 'Comment{id: $id, user: $user, content: $content, date: $date}';
  }
}
