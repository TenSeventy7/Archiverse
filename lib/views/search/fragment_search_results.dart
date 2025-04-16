import 'package:archiverse/extensions/context.dart';
import 'package:archiverse/providers/provider_search.dart';
import 'package:archiverse/views/search/fragment_search_common.dart';
import 'package:archiverse/views/search/sections/section_authors.dart';
import 'package:archiverse/views/search/sections/section_characters.dart';
import 'package:archiverse/views/search/sections/section_common.dart';
import 'package:archiverse/views/search/sections/section_fandoms.dart';
import 'package:archiverse/views/search/sections/section_relationships.dart';
import 'package:archiverse/views/search/sections/section_tags.dart';
import 'package:archiverse/views/search/sections/section_works.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchResultsFragment extends CommonSearchFragment {
  static const String routeName = 'search/results/';
  const SearchResultsFragment({super.key});

  @override
  State<SearchResultsFragment> createState() => _SearchResultsFragmentState();
}

class _SearchResultsFragmentState extends State<SearchResultsFragment> {
  final ScrollController _scrollController = ScrollController();
  String _lastQuery = "";

  // List of result sections - easily extensible by adding new sections here
  final List<SearchResultSection> _sections = [
    WorksResultSection(),
    AuthorsResultSection(),
    FandomsResultSection(),
    CharactersResultSection(),
    RelationshipsResultSection(),
    TagsResultSection(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<SearchProvider>(context, listen: false);
      if (provider.query.isNotEmpty) {
        _fetchData(provider.query);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final provider = Provider.of<SearchProvider>(context);

    if (provider.query != _lastQuery && provider.query.isNotEmpty) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
      _fetchData(provider.query);
    }
  }

  Future<void> _fetchData(String query) async {
    if (query.isEmpty) return;

    setState(() {
      _lastQuery = query;
      // Mark all sections as loading
      for (var section in _sections) {
        section.isLoading = true;
      }
    });

    // Fetch data for all sections in parallel
    await Future.wait(_sections.map((section) => section.fetchData(query)));

    if (mounted && query == _lastQuery) {
      setState(() {
        for (var section in _sections) {
          section.isLoading = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchProvider>(context);

    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: context.commonPadding),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                int sectionIndex = index ~/ 2;
                bool isSpacer = index > 0 && index % 2 == 1;

                // Return spacer between sections
                if (isSpacer) {
                  return SizedBox(height: context.commonPadding);
                }

                // Return section widget
                if (sectionIndex < _sections.length) {
                  final section = _sections[sectionIndex];
                  return KeyedSubtree(
                    key: section.key,
                    child: section.buildSectionWidget(
                      context,
                      () => section.navigateToDetailedResults(
                        context,
                        provider.query,
                      ),
                    ),
                  );
                }

                // Extra padding at the bottom
                if (index == _sections.length * 2) {
                  return SizedBox(height: context.commonPadding * 2);
                }

                return null;
              },
              childCount:
                  _sections.length * 2 +
                  1, // Sections + spacers + bottom padding
            ),
          ),
        ),
      ],
    );
  }
}
