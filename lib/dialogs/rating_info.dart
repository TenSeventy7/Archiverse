import 'package:archiverse/components/rating_utils.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class _RatingInfoActivity extends StatelessWidget {
  final RatingInfo info;
  const _RatingInfoActivity({required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, scrolled) => [_buildAppBar(context)],
        body: SingleChildScrollView(
          padding: EdgeInsets.all(context.commonPaddingDouble),
          child: Column(
            children: [Text(info.information), const SizedBox(height: 48)],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsetsGeometry.only(
          left: 16.0,
          right: 16.0,
          top: 14.0,
          bottom: 14.0 + context.screenPadding.bottom,
        ),
        color: context.theme.colorScheme.surfaceContainer,
        child: Row(
          spacing: 16.0,
          children: [
            Expanded(
              child: FilledButton.tonalIcon(
                onPressed: () => {
                  // TODO: Implement learn more action
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text(
                        "This should open a web page with more info.",
                      ),
                    ),
                  ),
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: Icon(TablerIcons.info_circle),
                label: Text("Learn more"),
              ),
            ),
            Expanded(
              child: FilledButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("OK"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar.large(
      title: Text(info.label),
      centerTitle: true,
      shape: RoundedRectangleBorder(),
      expandedHeight: 200.0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Directionality.of(context) == TextDirection.rtl
              ? TablerIcons.arrow_right
              : TablerIcons.arrow_left,
          size: 22.0,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.commonPaddingDouble,
          ),
          child: buildExpandedAppBarWidget(context),
        ),
      ),
    );
  }

  Widget buildExpandedAppBarWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: context.screenPadding.top + kToolbarHeight),
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: info.backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(info.icon, color: info.foregroundColor, size: 42),
        ),
        const SizedBox(height: 16),
        Text(info.label, style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}

class RatingInfoDialog {
  static void showSheet(BuildContext context, {required RatingInfo info}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => _RatingInfoActivity(info: info),
        fullscreenDialog: true,
      ),
    );
  }
}
