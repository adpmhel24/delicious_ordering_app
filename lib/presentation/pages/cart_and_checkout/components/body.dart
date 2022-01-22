import 'package:delicious_ordering/common_bloc/cart_bloc/bloc.dart';
import 'package:delicious_ordering/data/repositories/app_repo.dart';
import 'package:delicious_ordering/data/repositories/cart_repo.dart';

import 'package:delicious_ordering/utils/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './add_ons_button.dart';
import './form.dart';

import 'cart_list_view.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceInfo = MediaQuery.of(context);
    CartRepo _cartRepo = AppRepo.cartRepository;

    return Column(
      children: [
        HeaderWidget(deviceInfo: deviceInfo),
        CartListView(),
        Divider(
          color: Colors.grey,
          thickness: 2.0,
        ),
        Container(
          margin: EdgeInsets.only(top: 10, right: 10, bottom: 10),
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width / 4.5),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TOTAL: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      Text(
                        formatStringToDecimal(
                          _cartRepo.totalCart.toString(),
                          hasCurrency: true,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'DELIVERY FEE: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      Text(
                        formatStringToDecimal(
                          _cartRepo.delfee.toString(),
                          hasCurrency: true,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'GRAND TOTAL: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      Text(
                        formatStringToDecimal(
                          _cartRepo.grantTotal.toString(),
                          hasCurrency: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TENDERED AMOUNT: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        formatStringToDecimal(
                          _cartRepo.tenderedAmnt.toString(),
                          hasCurrency: true,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'CHANGE AMOUNT: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Colors.red),
                      ),
                      Text(
                        formatStringToDecimal(
                          _cartRepo.changeAmount.toString(),
                          hasCurrency: true,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        Divider(
          color: Colors.grey,
          thickness: 2.0,
        ),
        AddOnButtons(
          cartRepo: _cartRepo,
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(),
                  color: Color(0xFFB762C1),
                ),
                child: Text(
                  "Delivery / Pick-up Details",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              Form(child: CheckOutForm())
            ],
          ),
        )
      ],
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required this.deviceInfo,
  }) : super(key: key);

  final MediaQueryData deviceInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
      padding: EdgeInsets.only(top: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: deviceInfo.size.width * .02),
            child: SizedBox(
                width: deviceInfo.size.width * .350,
                child: Text(
                  'Product',
                  textAlign: TextAlign.center,
                )),
          ),
          Container(
            margin: EdgeInsets.only(right: deviceInfo.size.width * .02),
            child: SizedBox(
                width: deviceInfo.size.width * .15,
                child: Text(
                  'Quantity',
                  textAlign: TextAlign.center,
                )),
          ),
          Container(
            margin: EdgeInsets.only(right: deviceInfo.size.width * .02),
            child: SizedBox(
                width: deviceInfo.size.width * .15,
                child: Text(
                  'Price',
                  textAlign: TextAlign.center,
                )),
          ),
          Container(
            child: SizedBox(
                width: deviceInfo.size.width * .15,
                child: Text(
                  'Subtotal',
                  textAlign: TextAlign.center,
                )),
          ),
        ],
      ),
    );
  }
}
