import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/features/search/providers/search_provider.dart';
import 'package:notesmedia/features/search/screens/topic_details_page.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchProvider(),
      child: const _SearchView(),
    );
  }
}

class _SearchView extends StatefulWidget {
  const _SearchView();

  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _suggestions = [
    "Machine Learning Basics",
    "Data Structures and Algorithms",
    "JEE Main Physics",
    "SSC General Knowledge",
    "B.Tech Calculus",
    "B.C.A Programming",
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.grey[800];
    final hintColor = isDarkMode ? Colors.grey[400] : Colors.grey[600];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4F46E5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Search",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: ValueListenableBuilder(
                valueListenable: _searchController,
                builder: (context, TextEditingValue value, child) {
                  return TextField(
                    controller: _searchController,
                    autofocus: true,
                    style: GoogleFonts.poppins(fontSize: 16, color: textColor),
                    decoration: InputDecoration(
                      hintText: "Search notes, subjects...",
                      hintStyle: GoogleFonts.poppins(color: hintColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: isDarkMode ? Colors.grey[850] : Colors.grey[200],
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: value.text.isNotEmpty
                          ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          searchProvider.search('');
                        },
                      )
                          : null,
                    ),
                    onChanged: (query) => searchProvider.debounceSearch(query),
                    onSubmitted: (query) {
                      searchProvider.search(query);
                      searchProvider.saveSearchQuery(query);
                    },
                  );
                },
              ),
            ),

            // Results / history / suggestions
            Expanded(
              child: Consumer<SearchProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (provider.errorMessage != null) {
                    return Center(
                      child: Text(
                        provider.errorMessage!,
                        style: GoogleFonts.poppins(fontSize: 16, color: Colors.red),
                      ),
                    );
                  }
                  if (provider.query.isEmpty) {
                    return _buildHistoryAndSuggestions(provider, textColor!, hintColor!);
                  }
                  return _buildResults(provider);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResults(SearchProvider provider) {
    if (provider.results.isEmpty) {
      return Center(
        child: Text(
          "No results found",
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[600]),
        ),
      );
    }

    return ListView.builder(
      itemCount: provider.results.length,
      itemExtent: 80,
      itemBuilder: (context, index) {
        final item = provider.results[index];
        return ListTile(
          title: Text(
            item.topic,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            item.excerpt ?? "",
            style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[700]),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () {
            final topicNameId = item.slug ?? item.topicNameId ?? '';
            final topicName = item.topic;
            final courseId = item.courseId ?? '1';

            if (topicNameId.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TopicDetailsPage(
                    courseId: int.parse(courseId),
                    topicNameId: topicNameId,
                    topicName: topicName,
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Unable to load topic details')),
              );
            }
          },
        );
      },
    );
  }

  Widget _buildHistoryAndSuggestions(SearchProvider provider, Color textColor, Color hintColor) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (provider.searchHistory.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent Searches",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                  GestureDetector(
                    onTap: provider.clearSearchHistory,
                    child: Text(
                      "Clear All",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF4F46E5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: provider.searchHistory.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.history),
                  title: Text(provider.searchHistory[index],
                      style: GoogleFonts.poppins(fontSize: 14, color: textColor)),
                  trailing: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => provider.removeSearchHistoryItem(index),
                  ),
                  onTap: () {
                    _searchController.text = provider.searchHistory[index];
                    provider.search(provider.searchHistory[index]);
                  },
                );
              },
            ),
          ],

          // Popular suggestions
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text("Popular Suggestions",
                style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _suggestions.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.search),
                title: Text(_suggestions[index],
                    style: GoogleFonts.poppins(fontSize: 14, color: textColor)),
                onTap: () {
                  _searchController.text = _suggestions[index];
                  provider.search(_suggestions[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
