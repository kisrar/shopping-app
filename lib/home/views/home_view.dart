import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/home_view_model.dart';
import 'widgets/products_gridview.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<HomeViewModel>(context, listen: false);
    viewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Image.asset(
          'assets/images/nykaa-logo.png',
          height: 20,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.black)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border, color: Colors.black)),
          IconButton(
              onPressed: () {},
              icon:
                  const Icon(Icons.shopping_bag_outlined, color: Colors.black))
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            height: 100,
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 4, 0, 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    'Nykaa Korean Beauty',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                Expanded(
                  child: Consumer<HomeViewModel>(
                      builder: ((context, model, child) {
                    return Text(
                      '${model.totalRecords} products',
                      style: const TextStyle(color: Colors.grey),
                    );
                  })),
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Chip(
                        side: BorderSide(width: 0.5, color: Colors.grey),
                        padding: EdgeInsets.all(8),
                        backgroundColor: Colors.white,
                        //CircleAvatar
                        label: Text(
                          'Sheet Masks',
                        ), //Text
                      ),
                      const SizedBox(width: 4),
                      Chip(
                        side: BorderSide(width: 0.5, color: Colors.grey),
                        padding: EdgeInsets.all(8),
                        backgroundColor: Colors.white,
                        //CircleAvatar
                        label: Text(
                          'Masks & Peels',
                        ), //Text
                      ),
                      const SizedBox(width: 4),
                      Chip(
                        side: BorderSide(width: 0.5, color: Colors.grey),
                        padding: EdgeInsets.all(8),
                        backgroundColor: Colors.white,
                        //CircleAvatar
                        label: Text(
                          'Sleeping Masks',
                        ), //Text
                      ),
                      const SizedBox(width: 4),
                      Chip(
                        side: BorderSide(width: 0.5, color: Colors.grey),
                        padding: EdgeInsets.all(8),
                        backgroundColor: Colors.white,
                        //CircleAvatar
                        label: Text(
                          'Sleeping Masks',
                        ), //Text
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: ProductsGridView(),
      ),
    );
  }
}
