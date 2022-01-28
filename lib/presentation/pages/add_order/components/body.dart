import 'package:delicious_ordering/common_bloc/products_bloc/bloc.dart';
import 'package:delicious_ordering/presentation/widgets/custom_loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'grid_view.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<void> _refresh(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 200));
    BlocProvider.of<ProductsBloc>(context).add(FetchProductFromAPI());
  }

  @override
  void initState() {
    context.read<ProductsBloc>()..add(FetchProductFromLocal());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, ProductsState>(
      listener: (context, state) {
        if (state is LoadingProductsState) {
          customLoadingDialog(context);
        } else if (state is LoadedProductsState) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        if (state is LoadedProductsState) {
          return RefreshIndicator(
            onRefresh: () => _refresh(context),
            child: ProductGrid(products: state.products),
          );
        } else {
          return RefreshIndicator(
            child: Center(
              child: Text('No Products'),
            ),
            onRefresh: () => _refresh(context),
          );
        }
      },
    );
  }
}
