import 'package:archiverse/models/user.dart';
import 'package:archiverse/models/work.dart';

enum GiftStatus { PENDING, ACCEPTED, REJECTED }

enum GiftOccasion { EXCHANGE, BIRTHDAY, HOLIDAY, OTHER }

class Gift {
  final User sender, recipient;
  final Work work;

  final String? message;
  final GiftStatus status;
  final GiftOccasion occasion;

  const Gift({
    required this.work,
    required this.sender,
    required this.recipient,
    this.message,
    this.status = GiftStatus.PENDING,
    this.occasion = GiftOccasion.EXCHANGE,
  });
}
