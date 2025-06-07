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

  CommonDetailActivityState(this.item);

  Future<T> fetchItem();

  void _fetchItem() async {
    try {
      T fetch = await fetchItem();
      if (mounted) {
        setState(() {
          item = fetch;
          state = LoadingState.LOADED;
        });
        onItemLoaded();
      }
    } catch (e) {
      print(e);
      if (mounted) {
        setState(() {
          state = LoadingState.ERROR;
        });
      }
    }
  }

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
    item = widget.item; // Use the item passed from the widget as initial data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchItem();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

        body: (context, controller) => _buildBody(context, controller),
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
          if (primary != null) primary,
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
      body: Skeletonizer(
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
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar.large(
      title: buildTitle(context),
      centerTitle: true,
      shape: RoundedRectangleBorder(),
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
        background: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.commonPaddingHalf),
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
