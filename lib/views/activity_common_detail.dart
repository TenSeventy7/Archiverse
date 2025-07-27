import 'package:archiverse/components/expressive/sliver_app_bar.dart';
import 'package:archiverse/components/inverse_rounded_rectangle_border.dart';
import 'package:archiverse/components/load_error.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/loading_states.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class CommonDetailActivity<T> extends CommonActivity {
  final T item;

  const CommonDetailActivity({super.key, required this.item});

  @override
  CommonDetailActivityState<T> createState();
}

abstract class CommonDetailActivityState<T>
    extends State<CommonDetailActivity<T>> {
  T item;
  LoadingState state = LoadingState.LOADING;
  final ScrollController _scrollController = ScrollController();
  double _appBarOpacity = 0.0;

  CommonDetailActivityState(this.item);

  Future<T> fetchItem({bool refresh = false});

  Future<void> _fetchItem({bool refresh = false}) async {
    setState(() {
      state = LoadingState.LOADING;
    });

    try {
      final T result = await fetchItem(refresh: refresh);
      if (mounted) {
        setState(() {
          item = result;
          state = LoadingState.LOADED;
        });
        onItemLoaded();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          state = LoadingState.ERROR;
        });
      }
    }
  }

  // Subclasses can override this for additional refresh logic
  Future<void> onRefreshContent() async {}

  // Add refresh method that subclasses can override
  Future<void> onRefresh() async {
    // Force refresh the main item
    await _fetchItem(refresh: true);

    // Call subclass-specific refresh logic
    await onRefreshContent();
  }

  bool get hasRefresh => true;
  bool get _canRefresh =>
      hasRefresh &&
      state != LoadingState.LOADING &&
      state != LoadingState.ERROR;

  void _refreshItem() {
    setState(() {
      state = LoadingState.LOADING;
    });
    _fetchItem();
  }

  void onItemLoaded() {
    // Override in subclasses
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateAppBarOpacity);
    item = widget.item; // Use the item passed from the widget as initial data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchItem();
    });
  }

  void _updateAppBarOpacity() {
    // Adjust these values as needed for your design
    final double fadeStart = 0.0;
    final double fadeEnd = (getExpandedHeight(context) ?? 200) - kToolbarHeight;
    final double offset = _scrollController.hasClients
        ? _scrollController.offset
        : 0.0;
    double opacity = ((offset - fadeStart) / (fadeEnd - fadeStart)).clamp(
      0.0,
      1.0,
    );
    if (opacity != _appBarOpacity) {
      setState(() {
        _appBarOpacity = opacity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: state == LoadingState.ERROR
          ? null
          : Color.lerp(
              context.theme.colorScheme.surfaceContainer,
              context.theme.colorScheme.surfaceContainerHigh,
              _appBarOpacity,
            ),
      // Error state uses a simple app bar
      appBar: state == LoadingState.ERROR
          ? AppBar(
              toolbarHeight: kToolbarHeight + 8.0,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Directionality.of(context) == TextDirection.rtl
                      ? TablerIcons.arrow_right
                      : TablerIcons.arrow_left,
                  size: 22.0,
                ),
              ),
            )
          : null,
      body: BottomBar(
        borderRadius: BorderRadius.circular(500),
        clip: Clip.antiAlias,
        width: context.screenWidth * 1.0,
        offset: 24.0,
        hideOnScroll: true,
        curve: Curves.easeInOutCubicEmphasized,
        duration: Durations.medium1,
        barColor: Colors.transparent,

        showIcon: state == LoadingState.LOADED,
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
        body: (context, controller) => _buildBody(context, _scrollController),
        child: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    // If the state is loading, show a loading indicator
    if (state == LoadingState.LOADING) {
      return SizedBox();
    }

    List<Widget>? actions = buildBottomBar(context);
    Widget? primary = buildBottomActionButton(context);

    if (actions == null && primary == null) {
      // If no actions or primary button, return an empty container
      return SizedBox();
    }

    // Otherwise, build the bottom bar
    return SizedBox(
      height: 56.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8.0,
        children: [
          Material(
            elevation: 6.0,
            color: context.theme.colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(500),
            child: actions != null
                ? Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: context.commonPaddingHalf,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: actions,
                    ),
                  )
                : SizedBox(),
          ),
          if (primary != null && state != LoadingState.ERROR) primary,
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, ScrollController controller) {
    // On error, show error screen and allow user to retry
    if (state == LoadingState.ERROR) {
      return LoadError(onPressed: _refreshItem);
    }

    // Else, show details of item
    return NestedScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (context, scrolled) => [_buildAppBar(context)],
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
        ),
        child: RefreshIndicator(
          notificationPredicate: _canRefresh ? (_) => true : (_) => false,
          onRefresh: onRefresh,
          child: Skeletonizer(
            enabled: state != LoadingState.LOADED,
            child: CustomScrollView(
              slivers: [
                ...buildDetailSlivers(context),
                if (state == LoadingState.LOADED) ...[
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 48.0,
                    ), // Add some spacing at the bottom for floating bar
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar.large(
      title: buildTitle(context),
      titleTextStyle: context.theme.textTheme.titleMedium?.apply(
        fontSizeDelta: 5.0,
      ),
      titleSpacing: 8.0,
      elevation: 0,
      scrolledUnderElevation: 0.0,
      backgroundColor: Color.lerp(
        context.theme.colorScheme.surfaceContainer,
        context.theme.colorScheme.surfaceContainerHigh,
        _appBarOpacity,
      ),
      shape: const InverseRoundedRectangleBorder(radius: 24.0),
      collapsedHeight: ExpressiveSliverAppBar.kToolbarHeight + 24.0,
      expandedHeight: getExpandedHeight(context),
      actions: buildAppBarActions(context),
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
        background: Container(
          color: Color.lerp(
            context.theme.colorScheme.surfaceContainer,
            context.theme.colorScheme.surfaceContainerHigh,
            _appBarOpacity,
          ),
          padding: EdgeInsets.only(
            left: context.commonPaddingHalf,
            right: context.commonPaddingHalf,
            bottom: 8.0,
          ),
          child: buildExpandedAppBarWidget(context),
        ),
      ),
      bottom: buildAppBarBottom(context),
    );
  }

  // Overridable methods
  List<Widget>? buildBottomBar(BuildContext context) => null;
  Widget? buildBottomActionButton(BuildContext context) => null;
  List<Widget>? buildAppBarActions(BuildContext context) => null;
  PreferredSizeWidget? buildAppBarBottom(BuildContext context) => null;
  List<Widget> buildDetailSlivers(BuildContext context);
  Widget buildExpandedAppBarWidget(BuildContext context);
  Widget buildTitle(BuildContext context);
  double? getExpandedHeight(BuildContext context);
}
