import 'package:archiverse/api.dart';
import 'package:archiverse/components/user_image.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';

class LiveUserImage extends StatelessWidget {
  const LiveUserImage({super.key, this.deferred = false, required this.author});

  final bool deferred;
  final Pseud author;

  @override
  Widget build(BuildContext context) {
    return EnhancedFutureBuilder(
      future: !deferred ? AppApi().getPseud(author) : null,
      rememberFutureResult: true,
      whenDone: (author) => UserImage(context: context, user: author, size: 28),
      whenNotDone: UserImage(context: context, user: author, size: 28),
    );
  }
}
