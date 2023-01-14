

import 'package:flutter/material.dart';

import '../repositories/home_repository.dart';

enum HomeStatus { showLoader, showSearching, showData, showEmpty}

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  final HomeRepository _homeRepository;
  // List<MovieCardViewModel> movies = [];
  HomeStatus homeStatus = HomeStatus.showLoader;
  bool _showSearchBar = false;
  int currentPage = 1;
  int totalPage = 1;
  bool isSearching = false;
  TextEditingController searchTEC = TextEditingController();

  void showHideSearchBar() {
    _showSearchBar = !_showSearchBar;
    notifyListeners();
  }

  bool get showSearchBar => _showSearchBar;

  
  Future<void> getProducts(
      {bool isRefresh = false, bool loadingMore = false}) async {
    // isSearching = false;

    // if (isRefresh) {
    //   currentPage = 1;
    // }
    // if (loadingMore) {
    //   homeStatus = HomeStatus.showLoader;
    //   notifyListeners();
    // }

    // MovieResponseModel? movieResponseModel =
    //     await _homeRepository.getProducts(page: currentPage++);
    // totalPage = movieResponseModel?.totalPages ?? 1;
    // List<MovieCardViewModel> newMovies = movieResponseModel?.movies
    //         .map((movie) => MovieCardViewModel(movie: movie))
    //         .toList() ??
    //     [];
    // if (isRefresh) {
    //   movies = newMovies;
    // } else {
    //   movies.addAll(newMovies);
    // }
    // if (movies.isEmpty) {
    //   homeStatus = HomeStatus.showEmpty;
    // } else {
    //   homeStatus = HomeStatus.showData;
    // }
    // notifyListeners();
  }
}
