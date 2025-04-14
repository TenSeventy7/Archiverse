import 'package:archiverse/api/ao3_api.dart';
import 'package:archiverse/components/cards/work_card.dart';
import 'package:archiverse/components/suggestions/work_suggestions.dart';
import 'package:archiverse/components/text_header.dart';
import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/models/work.dart';
import 'package:archiverse/placeholders.dart';
import 'package:archiverse/providers/provider_search.dart';
import 'package:archiverse/views/search/fragment_work_results.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SearchResultsFragment extends StatefulWidget {
  final String query;

  const SearchResultsFragment({Key? key, required this.query})
    : super(key: key);

  @override
  State<SearchResultsFragment> createState() => _SearchResultsFragmentState();
}

enum _SearchState { RESULTS, WORKS }

class _SearchResultsFragmentState extends State<SearchResultsFragment> {
  _SearchState _state = _SearchState.RESULTS;
  Widget _results = const SizedBox();
  String _lastQuery = "";

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _onBackPressed(context);
      },
      child: CustomScrollView(
        slivers: [
          SliverAnimatedSwitcher(
            switchInCurve: Curves.ease,
            switchOutCurve: Curves.ease,
            duration: const Duration(milliseconds: 350),
            child: _buildSearchState(context, widget.query),
          ),
        ],
      ),
    );
  }

  void _setState(BuildContext context, _SearchState nextState) {
    setState(() {
      _state = nextState;
    });
  }

  void _onBackPressed(BuildContext context) {
    switch (_state) {
      case _SearchState.RESULTS:
        Provider.of<SearchProvider>(context, listen: false).clearSearch();
        break;
      default:
        setState(() {
          _state = _SearchState.RESULTS;
        });
        break;
    }
  }

  Widget _buildSearchState(BuildContext context, String query) {
    // If the query has changed, rebuild the results widget
    // and remember it; so that we don't rebuild it again.
    if (query != _lastQuery) {
      _lastQuery = query;
      _buildResults(context, query);

      _state = _SearchState.RESULTS; // Reset state when query changes
    }

    switch (_state) {
      case _SearchState.RESULTS:
        return _results;
      case _SearchState.WORKS:
        return WorkSearchFragment(query: query);
    }
  }

  void _buildResults(BuildContext context, String query) {
    _results = SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: context.commonPadding),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          _buildWorksWidget(context, query),
          SizedBox(height: context.commonPadding),
        ]),
      ),
    );
  }

  Widget _buildWorksWidget(BuildContext context, String query) {
    Widget header = TextHeader.medium(
      title: "Works",
      actionText: Text("More"),
      onTap: () => _setState(context, _SearchState.WORKS),
    );

    return EnhancedFutureBuilder(
      future: Ao3Api().searchWorks(query, page: 1),
      rememberFutureResult: false,
      whenDone:
          (works) => WorkSuggestions(
            works: works,
            loading: false,
            header: header,
            elevation: 0,
          ),
      whenNotDone: Column(children: [CircularProgressIndicator()]),
      whenError: (error) => const SizedBox(),
    );
  }
}
