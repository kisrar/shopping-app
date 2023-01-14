import 'package:flutter/material.dart';

import '../../../login/models/models.dart';
import 'shimmer_container.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GridTile(
        footer: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Text(product.name!,
                style: const TextStyle(fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis)),
        child: Text('Image here')
        // CachedNetworkImage(
        //   imageUrl: product.posterImageUrl,
        //   fit: BoxFit.fill,
        //   errorWidget: (context, url, error) =>
        //       const Center(child: Icon(Icons.error)),
        //   progressIndicatorBuilder: (context, url, progress) =>
        //       const ShimmerContainer(height: 20),
        // ),
      ),
      // subtitle: Text(article.overview),
    );
  }
}
