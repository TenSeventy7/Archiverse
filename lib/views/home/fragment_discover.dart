import 'package:archiverse/components/cards/work_card.dart';
import 'package:archiverse/components/continue_reading_card.dart';
import 'package:archiverse/components/discover_header.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/placeholders.dart';
import 'package:flutter/material.dart';

class DiscoverFragment extends StatefulWidget {
  const DiscoverFragment({Key? key}) : super(key: key);

  @override
  _DiscoverFragmentState createState() => _DiscoverFragmentState();
}

class _DiscoverFragmentState extends State<DiscoverFragment> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          DiscoverHeader(
            userName: "John",
            onSearchTap: () {
              // Handle search tap
            },
          ),
        ];
      },
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: context.horizontalPadding,
            sliver: SliverList.list(
              children: [
                ContinueReadingCard(
                  work: Fillers.work,
                  history: Fillers.history,
                ),

                TextHeader.large(title: "Suggested for you"),
                // Dummy works
                Column(
                  spacing: 8.0,
                  children: [
                    ..._generateDummyWorks(5).map((work) {
                      return WorkCard(work: work);
                    }).toList(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _generateDummyWorks(int length) {
    List<Work> works = Fillers.generateRandomWorks(length);
    List<Work> dummyWorks = [];
    for (int i = 0; i < length; i++) {
      dummyWorks.add(works[i % works.length]);
    }
    return dummyWorks;
  }
}
