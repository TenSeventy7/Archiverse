import 'package:archiverse/models/chapter.dart';
import 'package:archiverse/models/work.dart';

// ignore: constant_identifier_names
enum ReadStatus { STARTED, IN_PROGRESS, COMPLETED }

class ReadHistory {
  final Work work;
  final Chapter? chapter;

  final DateTime timestamp;
  final int position;
  final ReadStatus status;
  final double completion; // Percentage; from 0.0 to 1.0
  final int hits; // Number of times the work has been read

  const ReadHistory({
    required this.work,
    this.chapter,
    required this.timestamp,
    required this.position,
    required this.status,
    required this.completion,
    this.hits = 1,
  });

  ReadHistory copyWith({
    Work? work,
    Chapter? chapter,
    DateTime? timestamp,
    int? position,
    ReadStatus? status,
    double? completion,
    int? hits,
  }) {
    return ReadHistory(
      work: work ?? this.work,
      chapter: chapter ?? this.chapter,
      timestamp: timestamp ?? this.timestamp,
      position: position ?? this.position,
      status: status ?? this.status,
      completion: completion ?? this.completion,
      hits: hits ?? this.hits,
    );
  }
}
