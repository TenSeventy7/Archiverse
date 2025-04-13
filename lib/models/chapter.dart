/*
 * (C) 2024, John Vincent Corcega <archiverse@tenseventyseven.xyz>
 * This code is licensed under GNU GPL 3.0 or later. See LICENSE for details.
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

class Chapter {
  final bool oneshot;
  final int workId, id, chapter, words, comments;
  final String title;
  final DateTime? publishDate;
  final String? summary, preface, postface, content;

  const Chapter({
    required this.oneshot,
    required this.workId,
    required this.id,
    required this.chapter,
    required this.title,
    required this.publishDate,
    this.summary,
    this.preface,
    this.postface,
    this.content,
    this.words = 0,
    this.comments = 0,
  });

  Chapter copyWith({
    bool? oneshot,
    int? workId,
    int? id,
    int? chapter,
    String? title,
    DateTime? publishDate,
    String? summary,
    String? preface,
    String? postface,
    String? content,
    int? words,
    int? comments,
  }) {
    return Chapter(
      oneshot: oneshot ?? this.oneshot,
      workId: workId ?? this.workId,
      id: id ?? this.id,
      chapter: chapter ?? this.chapter,
      title: title ?? this.title,
      publishDate: publishDate ?? this.publishDate,
      summary: summary ?? this.summary,
      preface: preface ?? this.preface,
      postface: postface ?? this.postface,
      content: content ?? this.content,
      words: words ?? this.words,
      comments: comments ?? this.comments,
    );
  }

  @override
  String toString() {
    return 'Chapter{oneshot: $oneshot, workId: $workId, id: $id, chapter: $chapter, title: $title, publishDate: $publishDate, summary: $summary, preface: $preface, postface: $postface, content: $content}';
  }
}
