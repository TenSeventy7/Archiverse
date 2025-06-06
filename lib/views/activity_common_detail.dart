import 'package:archiverse/components/load_error.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/loading_states.dart';
import 'package:archiverse/views/activity_common.dart';
import 'package:flutter/material.dart';
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
      appBar:
          state == LoadingState.ERROR
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
      body: _buildBody(context),
      bottomNavigationBar:
          state != LoadingState.ERROR ? buildBottomBar(context) : null,
    );
  }

  Widget _buildBody(BuildContext context) {
    // On error, show error screen and allow user to retry
    if (state == LoadingState.ERROR) {
      return LoadError(onPressed: _refreshItem);
    }

    // Else, show details of item
    return NestedScrollView(
      headerSliverBuilder: (context, scrolled) => [_buildAppBar(context)],
      body: Skeletonizer(
        enabled: state != LoadingState.LOADED,
        child: CustomScrollView(slivers: buildDetailSlivers(context)),
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
  Widget? buildBottomBar(BuildContext context) => null;
  List<Widget>? buildAppBarActions(BuildContext context) => null;
  PreferredSizeWidget? buildAppBarBottom(BuildContext context) => null;
  List<Widget> buildDetailSlivers(BuildContext context);
  Widget buildExpandedAppBarWidget(BuildContext context);
  Widget buildTitle(BuildContext context);
  double? getExpandedHeight(BuildContext context);
}
