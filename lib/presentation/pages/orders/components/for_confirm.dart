import 'package:delicious_ordering/common_bloc/order_bloc/bloc.dart';
import 'package:delicious_ordering/presentation/widgets/custom_loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_item.dart';

class OrdersForConfirm extends StatefulWidget {
  const OrdersForConfirm({Key? key}) : super(key: key);

  @override
  State<OrdersForConfirm> createState() => _OrdersForConfirmState();
}

class _OrdersForConfirmState extends State<OrdersForConfirm> {
  Future<void> _refresh(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 200));
    BlocProvider.of<OrdersBloc>(context).add(FetchForConfirmOrders());
  }

  @override
  void initState() {
    context.read<OrdersBloc>()..add(FetchForConfirmOrders());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersBloc, OrdersState>(
      buildWhen: (prevState, currState) =>
          currState is LoadingOrdersForConfirm ||
          currState is LoadedOrdersForConfirm,
      listener: (context, state) {
        if (state is LoadingOrdersForConfirm) {
          customLoadingDialog(context);
        } else if (state is LoadedOrdersForConfirm) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        if (state is LoadedOrdersForConfirm) {
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
