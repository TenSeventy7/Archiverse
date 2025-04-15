import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/compact_text_icon.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/pseud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html/parser.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AuthorItem extends StatelessWidget {
  final Pseud author;
  final bool compact;
  const AuthorItem({super.key, required this.author}) : compact = false;
  const AuthorItem.compact({super.key, required this.author}) : compact = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Avatar
        _buildAvatar(context),

        const SizedBox(width: 16.0),

        // Author details
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name and pseudonym
              _buildNameSection(context),

              const SizedBox(height: 4.0),

              // Stats row
              _buildAuthorStatistics(context),
            ],
          ),
        ),

        // Options button
        Skeleton.leaf(
          child: IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: () {
              // TODO: Show author options dialog
            },
            icon: Icon(
              TablerIcons.dots_vertical,
              size: 18.0,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = compact ? 48.0 : 64.0;

    return Skeleton.leaf(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer,
          shape: BoxShape.circle,
          image:
              author.hasImage && author.imageUrl != null
                  ? DecorationImage(
                    image: NetworkImage(author.imageUrl!),
                    fit: BoxFit.cover,
                  )
                  : null,
        ),
        child:
            !author.hasImage || author.imageUrl == null
                ? Center(
                  child: Icon(
                    TablerIcons.user,
                    size: size / 2,
                    color: colorScheme.onPrimaryContainer,
                  ),
                )
                : null,
      ),
    );
  }

  Widget _buildNameSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display pseudonym if different from username
        if (author.isPseud)
          Text(
            author.pseud,
            style: context.textTheme.titleMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

        // Always display username
        Text(
          author.isPseud ? "(${author.name})" : author.name,
          style: context.textTheme.titleSmall?.copyWith(
            color: author.isPseud ? colorScheme.onSurfaceVariant : null,
            fontWeight: !author.isPseud ? FontWeight.w600 : null,
            fontSize: !author.isPseud ? 18 : null,
          ),
        ),

        // Join date if available
        if (author.joinDate != null && !compact)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              children: [
                Icon(
                  TablerIcons.calendar,
                  size: 14.0,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4.0),
                Text(
                  "Joined ${_formatJoinDate(author.joinDate!)}",
                  style: context.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildBioExcerpt(BuildContext context) {
    return HtmlWidget(
      _getFirstParagraph(author.bio!),
      customWidgetBuilder: (element) {
        return Text(
          element.text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodySmall,
        );
      },
    );
  }

  Widget _buildAuthorStatistics(BuildContext context) {
    return Wrap(
      spacing: 12.0,
      runSpacing: 8.0,
      children: [
        if (author.works != null)
          CompactTextIcon.text(icon: TablerIcons.book, text: "${author.works}"),
        if (author.series != null)
          CompactTextIcon.text(
            icon: TablerIcons.books,
            text: "${author.series}",
          ),
        if (author.bookmarks != null)
          CompactTextIcon.text(
            icon: TablerIcons.bookmark,
            text: "${author.bookmarks}",
          ),
        if (!compact) ...[
          if (author.collections != null)
            CompactTextIcon.text(
              icon: TablerIcons.folder,
              text: "${author.collections}",
            ),
          if (author.gifts != null)
            CompactTextIcon.text(
              icon: TablerIcons.gift,
              text: "${author.gifts}",
            ),
        ],
      ],
    );
  }

  String _formatJoinDate(DateTime date) {
    return "${date.month}/${date.year}";
  }

  String _getFirstParagraph(String str) {
    var document = parse(str);
    var firstP = document.querySelector('p');
    return firstP != null ? firstP.outerHtml : '';
  }
}
