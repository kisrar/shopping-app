import 'package:flutter/material.dart';

class NoProductsFound extends StatelessWidget {
  const NoProductsFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         Image.asset('assets/images/no-products-found.png'),
          const SizedBox(height: 30),
      
          const Text('Sorry, No products found!',
              style:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
