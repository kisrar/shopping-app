import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../login/models/models.dart';
import 'shimmer_container.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      // decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Featured',
                    style: TextStyle(
                        color: Colors.pink,
                        letterSpacing: 1.1,
                        fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: product.image!,
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                      progressIndicatorBuilder: (context, url, progress) =>
                          const ShimmerContainer(height: 50),
                    ),
                  ),
                  Text(product.name!,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  Text(
                    '200 ml',
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '\u{20B9} ${product.mrp}',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBarIndicator(
                        rating: product.rating!.toDouble(),
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 15.0,
                        // direction: Axis.vertical,
                      ),
                      const SizedBox(width: 5),
                      Text('(${Random().nextInt(100)})',
                          style: TextStyle(color: Colors.black54))
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  // TODO : Add to favorite
                },
                child: Center(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                  child: Icon(Icons.favorite_border),
                )),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  color: Colors.pinkAccent,
                  child: Center(
                    child: Text(
                      'Add to Bag',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
