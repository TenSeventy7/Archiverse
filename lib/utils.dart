/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import 'package:archiverse/api.dart';
import 'package:archiverse/models/collection.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/models/series.dart';
import 'package:archiverse/models/tag.dart';
import 'package:archiverse/models/work.dart';
import 'package:flutter/widgets.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:relative_time/relative_time.dart';
import 'package:share_plus/share_plus.dart';

class AppUtils {
  static String formatAuthorList(
    List<Pseud> authors, {
    bool showPseud = true,
    int showCount = 3,
  }) {
    List<String> authorNames = [];

    for (var author in authors) {
      String authorName = showPseud && author.name != author.pseud
          ? "${author.pseud} (${author.name})"
          : author.name;

      if (!authorNames.contains(authorName)) {
        authorNames.add(authorName);
      }
    }

    if (authorNames.length > showCount) {
      return '${authorNames.take(showCount).join(', ')}, +${authorNames.length - showCount} more';
    } else {
      return authorNames.join(', ');
    }
  }

  static String formatCollectionName(Collection collection) {
    if (collection.name == collection.title) {
      return collection.name;
    } else {
      return '${collection.title} (${collection.name})';
    }
  }

  static String formatFandomsList(List<Tag> fandoms) {
    List<String> names = fandoms.map((fandom) => fandom.name).toList();
    if (names.length > 3) {
      return '${names.take(3).join(', ')} +${names.length - 3} more';
    } else {
      return names.join(', ');
    }
  }

  static String formatDate(
    BuildContext context,
    DateTime date, {
    bool proper = true,
    Iterable<TimeUnit> timeUnits = const [
      TimeUnit.year,
      TimeUnit.month,
      TimeUnit.week,
      TimeUnit.day,
    ],
  }) {
    try {
      String relative = RelativeTime(
        context,
        timeUnits: timeUnits,
      ).format(date);

      // Capitalize the first letter of the string
      if (proper) {
        return '${relative[0].toUpperCase()}${relative.substring(1)}';
      } else {
        return relative;
      }
    } catch (e) {
      return "Unknown";
    }
  }

  static String formatDateTight(BuildContext context, DateTime date) {
    // If the date is up to yesterday, return relative time
    DateTime today = DateTime.now().toUtc();
    today = DateTime.utc(today.year, today.month, today.day);
    DateTime yesterday = today.subtract(const Duration(days: 1));

    if (date.isAfter(yesterday)) {
      // Show relative time for today or yesterday
      return AppUtils.formatDate(context, date);
    } else {
      // Otherwise, show full date in proper locale
      if (date.year == today.year) {
        // Same year: show "MMMM dd" or "dd MMMM" based on locale
        return DateFormat.MMMMd().format(date);
      } else {
        // Different year: include year based on locale
        return DateFormat.yMMMMd().format(date);
      }
    }
  }

  static String formatDateExact(BuildContext context, DateTime date) {
    String relative = RelativeTime(
      context,
      timeUnits: const [
        TimeUnit.year,
        TimeUnit.month,
        TimeUnit.week,
        TimeUnit.day,
        TimeUnit.hour,
        TimeUnit.minute,
        TimeUnit.second,
      ],
    ).format(date);

    // Capitalize the first letter of the string
    return '${relative[0].toUpperCase()}${relative.substring(1)}';
  }

  static String _formatLastUpdated(
    BuildContext context,
    DateTime? updatedDate,
    DateTime? publishDate,
  ) {
    DateTime? date = updatedDate ?? publishDate;
    if (date == null) return "Unknown";

    return formatDate(context, date);
  }

  static String formatWorkLastUpdated(BuildContext context, Work work) {
    return _formatLastUpdated(context, work.updateDate, work.publishDate);
  }

  static String formatSeriesLastUpdated(BuildContext context, Series series) {
    return _formatLastUpdated(context, series.updateDate, series.publishDate);
  }

  static String formatCollectionLastUpdated(
    BuildContext context,
    Collection collection,
  ) {
    return _formatLastUpdated(context, collection.creationDate, null);
  }

  static String getFirstParagraph(String str) {
    var document = parse(str);
    var firstP = document.querySelector('p');
    return firstP != null ? firstP.outerHtml : '';
  }

  static String formatCompactNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    } else {
      return number.toString();
    }
  }

  static String truncateHtml(String content, int length) {
    var document = parse(content);
    var text = document.body?.text ?? '';
    if (text.length <= length) {
      return text;
    } else {
      return '${text.substring(0, length)}...';
    }
  }

  static formatNumber(int num) {
    var currentLocale = Intl.getCurrentLocale();
    return NumberFormat('#,##0', currentLocale).format(num);
  }

  static String generateSharingLink(Object item) {
    return switch (item) {
      Work(id: final id) => 'works/$id',
      Series(id: final id) => 'series/$id',
      Collection(name: final name) => 'collections/$name',
      Tag(encodedName: final encodedName) => 'tags/$encodedName',
      Pseud(name: final name) => 'users/$name',
      _ => throw ArgumentError('Unsupported item type for sharing link'),
    };
  }

  static Uri generateSharingUri(Object item) {
    String path = generateSharingLink(item);
    return Uri.parse('${AppApi().baseUrl}$path');
  }

  static void shareItem(Object item) {
    SharePlus.instance.share(
      ShareParams(
        uri: generateSharingUri(item),
        subject: 'Check this out!',
        title: switch (item) {
          Work(title: final title) => title,
          Series(title: final title) => title,
          Collection(title: final title) => title,
          Tag(name: final name) => name,
          Pseud(name: final name) => name,
          _ => 'Check this out!',
        },
      ),
    );
  }
}
