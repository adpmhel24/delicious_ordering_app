import 'package:delicious_ordering/common_bloc/order_bloc/bloc.dart';
import 'package:delicious_ordering/presentation/widgets/custom_loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_item.dart';

class OrdersCompleted extends StatefulWidget {
  const OrdersCompleted({Key? key}) : super(key: key);

  @override
  State<OrdersCompleted> createState() => _OrdersCompletedState();
}

class _OrdersCompletedState extends State<OrdersCompleted> {
  Future<void> _refresh(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 200));
    BlocProvider.of<OrdersBloc>(context).add(FetchCompletedOrders());
  }

  @override
  void initState() {
    context.read<OrdersBloc>()..add(FetchCompletedOrders());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersBloc, OrdersState>(
      buildWhen: (prevState, currState) =>
          currState is LoadingOrdersCompeted ||
          currState is LoadedOrdersCompleted,
      listener: (context, state) {
        if (state is LoadingOrdersCompeted) {
          customLoadingDialog(context);
        } else if (state is LoadedOrdersCompleted) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        if (state is LoadedOrdersCompleted) {
          return RefreshIndicator(
            onRefresh: () => _refresh(context),
            child: ListView.builder(
              itemCount: state.orders.length,
              itemBuilder: (cntxt, i) {
                return OrderItem(state.orders[i]);
              },
            ),
          );
        } else {
          return RefreshIndicator(
            onRefresh: () => _refresh(context),
            child: Container(),
          );
        }
      },
    );
  }
}
