import 'package:flutter/material.dart';
import 'package:nykaa/home/views/widgets/product_card.dart';
import 'package:nykaa/home/views/widgets/shimmer_container.dart';
import 'package:provider/provider.dart';

import '../../view_models/home_view_model.dart';
import 'no_products_found.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({super.key});

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  ScrollController scrollController = ScrollController();
  late HomeViewModel homeViewModel;
  @override
  void initState() {
    super.initState();
    homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (homeViewModel.products.length < homeViewModel.totalRecords) {
          homeViewModel.getProducts(loadingMore: true);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: ((context, viewModel, child) {
        if (viewModel.homeStatus == HomeStatus.showEmpty) {
          return const NoProductsFound();
        }
        return RefreshIndicator(
          onRefresh: () async {
            viewModel.getProducts(isRefresh: true);
          },
          child: GridView.builder(
              controller: scrollController,
              itemCount: viewModel.homeStatus == HomeStatus.showLoader
                  ? viewModel.products.length + 10
                  : viewModel.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4),
              itemBuilder: (context, index) {
                if (index < viewModel.products.length) {
                  return ProductCard(product: viewModel.products[index]);
                } else {
                  return const ShimmerItem();
                }
              }),
        );
      }),
    );
  }
}
