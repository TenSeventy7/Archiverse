import 'package:archiverse/components/expressive/app_bar.dart';
import 'package:archiverse/components/expressive/scaffold.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/views/library/fragment_library_all.dart';
import 'package:archiverse/views/library/fragment_library_saved.dart';
import 'package:archiverse/views/library/fragment_library_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class LibraryFragment extends StatefulWidget {
  const LibraryFragment({super.key});

  @override
  State<LibraryFragment> createState() => _LibraryFragmentState();
}

class _LibraryFragmentState extends State<LibraryFragment>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  final List<String> _tabs = ['All', 'Saved', 'History'];
  final List<IconData> _tabIcons = [
    TablerIcons.star,
    TablerIcons.books,
    TablerIcons.history,
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _scrollController = ScrollController();
    _tabController.addListener(() {
      setState(() {});
      _scrollToSelectedTab();
    });
  }

  void _scrollToSelectedTab() {
    if (_scrollController.hasClients) {
      // Calculate approximate position for the selected tab
      final selectedIndex = _tabController.index;
      final itemWidth = 120.0; // Approximate width per tab
      final spacing = 6.0;
      final padding = 10.0;

      final targetPosition = (selectedIndex * (itemWidth + spacing)) - padding;
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;

      // Only scroll if the tab might be out of view
      final scrollPosition = targetPosition.clamp(0.0, maxScroll);

      if ((targetPosition - currentScroll).abs() > 50) {
        _scrollController.animateTo(
          scrollPosition,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpressiveScaffold(
      appBar: (controller) => ExpressiveAppBar(
        controller: controller,
        titleSpacing: 16.0,
        title: Text('Library'),
        actions: [
          IconButton(
            icon: const Icon(TablerIcons.search),
            onPressed: () {
              // Handle search action
            },
            tooltip: 'Search your library',
          ),
          IconButton(
            icon: const Icon(TablerIcons.adjustments),
            onPressed: () {
              // Handle filter/sort action
            },
            tooltip: 'Filter and sort',
          ),
        ],
      ),
      body: (controller) => BottomBar(
        scrollController: controller,
        borderRadius: BorderRadius.circular(500),
        clip: Clip.antiAlias,
        width: context.screenWidth * 1.0,
        offset: 16.0,
        hideOnScroll: true,
        curve: Curves.easeInOutCubicEmphasized,
        duration: Durations.medium1,
        barColor: context.theme.colorScheme.surfaceContainerHigh,

        iconWidth: 42.0,
        iconHeight: 42.0,
        iconDecoration: BoxDecoration(
          color: context.theme.colorScheme.primaryContainer,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: context.theme.colorScheme.shadow.withAlpha(64),
              blurRadius: 6.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        icon: (width, height) => Icon(
          TablerIcons.arrow_up,
          size: 22.0,
          color: context.theme.colorScheme.onPrimaryContainer,
        ),
        body: (context, controller) => _buildBody(controller),
        child: SizedBox(height: 64.0, child: _buildBottomBar(context)),
      ),
    );
  }

  double _estimateTabWidth(String text, bool isSelected) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: context.textTheme.labelLarge),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final textWidth = textPainter.size.width;
    final iconWidth = isSelected ? 20.0 + 8.0 : 0.0; // Icon + spacing
    final padding = 40.0; // 20.0 horizontal padding on each side

    return textWidth + iconWidth + padding;
  }

  Widget _buildBottomBar(BuildContext context) {
    return Material(
      elevation: 4.0,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(500),
      color: context.theme.colorScheme.surfaceContainer,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // More accurate width calculation
          double totalWidth = 0;
          for (int i = 0; i < _tabs.length; i++) {
            final isSelected = _tabController.index == i;
            totalWidth += _estimateTabWidth(_tabs[i], isSelected);
          }
          totalWidth += (_tabs.length - 1) * 6.0; // Spacing
          totalWidth += 20.0; // Padding

          final shouldCenter = totalWidth < constraints.maxWidth;

          return SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: shouldCenter ? constraints.maxWidth : 0,
              ),
              child: Row(
                mainAxisAlignment: shouldCenter
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.start,
                spacing: 8.0,
                children: _tabs.asMap().entries.map((entry) {
                  int index = entry.key;
                  return _buildTabItem(index);
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabItem(int index) {
    final isSelected = _tabController.index == index;

    return InkWell(
      borderRadius: BorderRadius.circular(500),
      onTap: () => _tabController.animateTo(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        height: 44.0,
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        decoration: BoxDecoration(
          color: isSelected
              ? context.theme.colorScheme.primaryContainer
              : Colors.transparent,
          borderRadius: BorderRadius.circular(500),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: isSelected
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsGeometry.only(bottom: 1.0),
                          child: Icon(
                            _tabIcons[index],
                            size: 20.0,
                            color: context.theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
            Text(
              _tabs[index],
              style: context.textTheme.labelLarge?.copyWith(
                color: isSelected
                    ? context.theme.colorScheme.onPrimaryContainer
                    : context.theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(ScrollController controller) {
    return TabBarView(
      controller: _tabController,
      children: [
        LibraryAllFragment(controller: controller),
        LibrarySavedFragment(controller: controller),
        LibraryHistoryFragment(controller: controller),
      ],
    );
  }
}
