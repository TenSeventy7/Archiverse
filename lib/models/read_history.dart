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
}
