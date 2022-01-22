import 'package:delicious_ordering/common_bloc/cart_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dismissible_cart.dart';

class CartListView extends StatelessWidget {
  // final List<CartItem> cartItems;
  const CartListView({
    Key? key,
    // required this.cartItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (prevState, currState) =>
          currState is CartLoaded || currState is EmptyCart,
      builder: (context, state) {
        if (state is CartLoaded) {
          return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.cartItems.length,
              itemBuilder: (context, index) {
                return DismissibleCart(cartItem: state.cartItems[index]);
              });
        }
        return Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Text('No Item In Cart'),
          ),
        );
      },
    );
  }
}
