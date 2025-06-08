import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/items/series_item.dart';
import 'package:archiverse/components/user_image.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:archiverse/models/series.dart';
import 'package:archiverse/views/activity_author.dart';
import 'package:archiverse/views/activity_common_list.dart';
import 'package:archiverse/views/activity_series.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class AuthorSeriesActivity extends CommonListActivity<Series> {
  const AuthorSeriesActivity({super.key, required this.author});
  static const String routeName = "/author/series";
  final Pseud author;

  @override
  TagWorksActivityState createState() => TagWorksActivityState();
}

class TagWorksActivityState extends CommonListActivityState<Series> {
  Pseud get author => (widget as AuthorSeriesActivity).author;

  @override
  Future<List<Series>> fetchItems(int page) async {
    return await Ao3Api().getSeriesByUser(author, page: page - 1);
  }

  @override
  Widget buildItemWidget(BuildContext context, Series item, int index) {
    return SeriesItem(series: item);
  }

  @override
  void onItemTap(Series item) {
    context.navigator.pushNamed(SeriesActivity.routeName, arguments: item);
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(author.name, maxLines: 1, overflow: TextOverflow.ellipsis);
  }

  @override
  double getExpandedHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.3;
  }

  @override
  Widget buildExpandedAppBarWidget(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Works count subtitle
        Text(
          "Series written by",
          style: context.textTheme.labelLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),

        SizedBox(height: 16),

        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 16.0,
          children: [
            // User avatar
            CircleAvatar(
              maxRadius: 32.0,
              backgroundColor: context.colorScheme.primaryContainer,
              child: EnhancedFutureBuilder(
                future: Ao3Api().getPseud(author),
                rememberFutureResult: false,
                whenDone: (author) =>
                    UserImage(context: context, user: author, size: 32),
                whenNotDone: UserImage(
                  context: context,
                  user: author,
                  size: 32,
                ),
              ),
            ),

            // User info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    author.isPseud ? author.pseud : author.name,
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // For pseuds, show the main username
                  if (author.isPseud)
                    Text(
                      "(${author.name})",
                      style: context.textTheme.titleSmall?.copyWith(
                        color: colorScheme.onSurface.withAlpha(170),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 12),

        ActionChip(
          onPressed: () {
            Navigator.pushNamed(
              context,
              AuthorActivity.routeName,
              arguments: author,
            );
          },
          label: Text("View pseud"),
          avatar: Icon(TablerIcons.chevron_right, size: 18),
        ),
      ],
    );
  }
}
