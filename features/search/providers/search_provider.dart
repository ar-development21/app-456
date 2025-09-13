import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:notesmedia/features/search/models/search_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchProvider extends ChangeNotifier {
  List<SearchResult> _results = [];
  List<String> _searchHistory = [];
  bool _isLoading = false;
  String _query = '';
  String? _errorMessage;
  Timer? _debounce;
  final String _hardcodedToken = 'oQtB7vmaH0W8mEuxbx3bWElxIK8jzqDfZvj7md5yXzjz12wwz18baUCgXIkR2RoG';

  List<SearchResult> get results => _results;
  List<String> get searchHistory => _searchHistory;
  bool get isLoading => _isLoading;
  String get query => _query;
  String? get errorMessage => _errorMessage;

  SearchProvider() {
    _loadSearchHistory();
  }

  Future<void> _loadSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    _searchHistory = prefs.getStringList('searchHistory') ?? [];
    notifyListeners();
  }

  Future<void> saveSearchQuery(String query) async {
    if (query.trim().isEmpty) return;
    if (!_searchHistory.contains(query)) {
      _searchHistory.insert(0, query);
      if (_searchHistory.length > 10) _searchHistory.removeLast();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('searchHistory', _searchHistory);
      notifyListeners();
    }
  }

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      _results = [];
      _query = '';
      _errorMessage = null;
      notifyListeners();
      return;
    }

    _query = query;
    _isLoading = true;
    _results = [];
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse("https://notesmedia.in/api/search?q=$query"),
       // headers: {'Authorization': 'Bearer $_hardcodedToken'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _results = List<Map<String, dynamic>>.from(data['results'])
            .map((json) => SearchResult.fromJson(json))
            .toList();
      } else {

        _errorMessage = 'Failed to fetch results: ${response.statusCode}';
      }
    } catch (e) {
      print("Search error: $e");
      _errorMessage = 'Search error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  void debounceSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      search(query);
    });
  }

  Future<void> clearSearchHistory() async {
    _searchHistory.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('searchHistory', _searchHistory);
    notifyListeners();
  }

  Future<void> removeSearchHistoryItem(int index) async {
    _searchHistory.removeAt(index);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('searchHistory', _searchHistory);
    notifyListeners();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}