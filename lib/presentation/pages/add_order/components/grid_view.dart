import 'package:delicious_ordering/configs/size_config.dart';
import 'package:delicious_ordering/presentation/pages/add_order/components/product_card.dart';
import 'package:flutter/material.dart';

import '/data/models/products/product.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductModel> products;
  const ProductGrid({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: SizeConfig.defaultSize,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ProductCard(product: products[i]),
    );
  }
}
