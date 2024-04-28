import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wework/models/movie_model.dart';
import 'package:wework/screens/home_screen/search_movies_bottomsheet/search_movie_item.dart';
import 'package:wework/widgets/section_header.dart';

class SearchMovieBottomsheet extends StatefulWidget {
  final List<Movie> nowPlayingMovies;
  final List<Movie> topRatedMovies;
  const SearchMovieBottomsheet({
    required this.nowPlayingMovies,
    required this.topRatedMovies,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchMovieBottomsheet> createState() => _SearchMovieBottomsheetState();
}

class _SearchMovieBottomsheetState extends State<SearchMovieBottomsheet> {
  List<Movie> _filteredNowPlayingMovies = [];
  List<Movie> _filteredTopRatedMovies = [];
  Timer? _debounce;

  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late String lastInputValue;

  @override
  void initState() {
    super.initState();
    lastInputValue = _searchController.text;
    _scrollController
        .addListener(() => FocusScope.of(context).requestFocus(FocusNode()));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Image.asset(
                        "assets/images/search_icon.png",
                        height: 20,
                        width: 20,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 25,
                      minHeight: 25,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                  ),
                  controller: _searchController,
                  maxLines: 1,
                  onChanged: (input) {
                    if (lastInputValue != input) {
                      lastInputValue = input;
                      _onSearchChanged(input);
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 4,
              ),
              child: SectionHeader(
                title: "NOW PLAYING",
                counter: widget.nowPlayingMovies.length,
              ),
            ),
            Expanded(
              child: Visibility(
                visible: _filteredNowPlayingMovies.isNotEmpty,
                replacement: emptyWidget(query: _searchController.text),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  itemCount: _filteredNowPlayingMovies.length,
                  itemBuilder: (BuildContext context, int i) => GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pop(_filteredNowPlayingMovies[i]),
                    child: SearchMovieItem(
                      movie: _filteredNowPlayingMovies[i],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 4,
              ),
              child: SectionHeader(
                title: "TOP RATED",
                counter: widget.topRatedMovies.length,
              ),
            ),
            Expanded(
              child: Visibility(
                visible: _filteredTopRatedMovies.isNotEmpty,
                replacement: emptyWidget(query: _searchController.text),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: _filteredTopRatedMovies.length,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  itemBuilder: (BuildContext context, int i) => GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pop(_filteredTopRatedMovies[i]),
                    child: SearchMovieItem(
                      movie: _filteredTopRatedMovies[i],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget emptyWidget({required String query}) {
    if (query.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/empty_list.png",
              height: 60,
            ),
            const SizedBox(height: 14),
            const Text("No results found."),
          ],
        ),
      );
    } else {
      return const Center(child: Text("Start typing..."));
    }
  }

  _onSearchChanged(String query) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (query.isEmpty) {
        _filteredNowPlayingMovies = [];
        _filteredTopRatedMovies = [];
        setState(() {});
        return;
      }
      _filteredNowPlayingMovies = widget.nowPlayingMovies
          .where((movie) =>
              movie.title.toLowerCase().contains(query.toLowerCase()) ||
              movie.overview.toLowerCase().contains(query.toLowerCase()))
          .toList();
      _filteredTopRatedMovies = widget.topRatedMovies
          .where((movie) =>
              movie.title.toLowerCase().contains(query.toLowerCase()) ||
              movie.overview.toLowerCase().contains(query.toLowerCase()))
          .toList();
      setState(() {});
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
