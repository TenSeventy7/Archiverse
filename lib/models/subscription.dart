/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/models/series.dart';
import 'package:archiverse/models/user.dart';
import 'package:archiverse/models/work.dart';

// ignore: constant_identifier_names
enum SubscriptionType { USER, WORK, SERIES, TAG }

class Subscription {
  final int id;
  final User subscriber;
  final User? subscribedUser;
  final Work? subscribedWork;
  final Series? subscribedSeries;
  final String? subscribedTag;
  final SubscriptionType type;
  final DateTime createdAt;
  final bool emailNotifications;

  Subscription({
    required this.id,
    required this.subscriber,
    this.subscribedUser,
    this.subscribedWork,
    this.subscribedSeries,
    this.subscribedTag,
    required this.type,
    required this.createdAt,
    this.emailNotifications = true,
  });

  bool get isUser => type == SubscriptionType.USER;
  bool get isWork => type == SubscriptionType.WORK;
  bool get isSeries => type == SubscriptionType.SERIES;
  bool get isTag => type == SubscriptionType.TAG;

  Subscription copyWith({
    int? id,
    User? subscriber,
    User? subscribedUser,
    Work? subscribedWork,
    Series? subscribedSeries,
    String? subscribedTag,
    SubscriptionType? type,
    DateTime? createdAt,
    bool? emailNotifications,
  }) {
    return Subscription(
      id: id ?? this.id,
      subscriber: subscriber ?? this.subscriber,
      subscribedUser: subscribedUser ?? this.subscribedUser,
      subscribedWork: subscribedWork ?? this.subscribedWork,
      subscribedSeries: subscribedSeries ?? this.subscribedSeries,
      subscribedTag: subscribedTag ?? this.subscribedTag,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      emailNotifications: emailNotifications ?? this.emailNotifications,
    );
  }

  @override
  String toString() {
    return 'Subscription(id: $id, subscriber: $subscriber, type: $type)';
  }
}
