import 'package:delicious_ordering/data/models/products/product.dart';
import 'package:delicious_ordering/presentation/pages/ordering/bloc/bloc.dart';
import 'package:delicious_ordering/presentation/pages/ordering/components/select_item_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            _showButtonSheet(context);
          },
          child: Container(
            padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            color: Color(0xFFE7FBBE),
            child: Text(
              product.itemName,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Color(0xFFFFCBCB),
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price : ${product.price}',
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showButtonSheet(BuildContext context) {
    return showMaterialModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: BlocProvider.value(
          value: BlocProvider.of<ProductSelectionBloc>(context),
          child: SelectItemForm(product: product),
        ),
      ),
    );
  }
}
