

import 'package:flutter/material.dart';
import 'package:nykaa/login/models/models.dart';

import '../repositories/home_repository.dart';

enum HomeStatus { showLoader, showData, showEmpty}

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  final HomeRepository _homeRepository;
  List<Product> products = [];
  HomeStatus homeStatus = HomeStatus.showLoader;
  int currentPage = 1;
  int totalRecords = 1;
  bool isSearching = false;

  
  Future<void> getProducts(
      {bool isRefresh = false, bool loadingMore = false}) async {

    if (isRefresh) {
      currentPage = 1;
    }
    if (loadingMore) {
      homeStatus = HomeStatus.showLoader;
      notifyListeners();
    }

    ProductsResponseModel? productResponseModel =
        await _homeRepository.getProducts(page: currentPage++);
    totalRecords = productResponseModel?.totalRecords ?? 1;
    List<Product> newProducts =productResponseModel?.products??[];
    if (isRefresh) {
      products = newProducts;
    } else {
      products.addAll(newProducts);
    }
    if (products.isEmpty) {
      homeStatus = HomeStatus.showEmpty;
    } else {
      homeStatus = HomeStatus.showData;
    }
    notifyListeners();
  }
}
