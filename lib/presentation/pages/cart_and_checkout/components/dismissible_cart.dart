import 'package:delicious_ordering/common_bloc/cart_bloc/bloc.dart';
import 'package:delicious_ordering/configs/size_config.dart';
import 'package:delicious_ordering/data/models/cart/cart_item_model.dart';
import 'package:delicious_ordering/utils/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DismissibleCart extends StatelessWidget {
  const DismissibleCart({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(cartItem.id.toString()),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(right: SizeConfig.screenWidth * .02),
                child: SizedBox(
                  width: SizeConfig.screenWidth * .350,
                  child: Text(cartItem.itemCode),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: SizeConfig.screenWidth * .02),
                child: SizedBox(
                  width: SizeConfig.screenWidth * .15,
                  child: Text(
                    formatStringToDecimal(
                      cartItem.quantity.toString(),
                      hasCurrency: false,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: SizeConfig.screenWidth * .02),
                child: SizedBox(
                  width: SizeConfig.screenWidth * .15,
                  child: Text(
                    formatStringToDecimal(
                      cartItem.unitPrice.toString(),
                      hasCurrency: true,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: SizeConfig.screenWidth * .01),
                child: SizedBox(
                  width: SizeConfig.screenWidth * .15,
                  child: Text(
                    formatStringToDecimal(
                      cartItem.total.toString(),
                      hasCurrency: true,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Icon(Icons.delete),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        context.read<CartBloc>().add(RemoveItemFromCart(cartItem));
      },
    );
  }
}
