import 'package:archiverse/components/cards/base_card.dart';
import 'package:archiverse/components/items/read_history_item.dart';
import 'package:archiverse/models/read_history.dart';
import 'package:flutter/material.dart';

class ReadHistoryCard extends BaseCard<ReadHistory> {
  const ReadHistoryCard({
    super.key,
    required ReadHistory history,
    super.elevation,
  }) : super(
         item: history,
         contentPadding: EdgeInsets.zero,
         isSelectable: false,
       );

  @override
  Widget buildContent(BuildContext context) {
    return ReadHistoryItem(history: item);
  }
}
