import 'package:delicious_ordering/common_bloc/cart_bloc/bloc.dart';
import 'package:delicious_ordering/presentation/pages/ordering/components/customer_order_details/bloc/bloc.dart';
import 'package:delicious_ordering/presentation/pages/ordering/ordering_home.dart';
import 'package:delicious_ordering/presentation/widgets/custom_warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'bloc/bloc.dart';
import 'components/body.dart';

class CartPage extends StatelessWidget {
  static final String routeName = '/cart';

  final BuildContext orderingHomeContext;

  const CartPage({Key? key, required this.orderingHomeContext})
      : super(key: key);

  static MaterialPageRoute<void> route(BuildContext context) =>
      MaterialPageRoute(
        builder: (_) => CartPage(orderingHomeContext: context),
      );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CheckOutBloc()),
        BlocProvider.value(
            value: BlocProvider.of<OrderCustDetailsBloc>(orderingHomeContext)),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Cart',
            style: Theme.of(context).textTheme.headline2,
          ),
          actions: [
            IconButton(
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                customWarningDialog(
                  context: context,
                  message: 'Are you sure you want to delete all?',
                  onPositiveClick: () {
                    context.read<CartBloc>().add(ClearCart());
                    Navigator.of(context).pop();
                  },
                );
              },
              icon: Icon(Icons.delete_forever),
            )
          ],
        ),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Body(),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8.0),
          child: Builder(builder: (context) {
            return BlocConsumer<CheckOutBloc, CheckOutState>(
              listener: (context, state) {
                if (state.isSuccess) {
                  Navigator.of(context).pop();
                  showAnimatedDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ClassicGeneralDialogWidget(
                        titleText: 'Success!',
                        contentText: state.message,
                        positiveText: 'Okay',
                        onPositiveClick: () {
                          Navigator.of(context)
                              .popAndPushNamed(OrderingHomePage.routeName);
                        },
                      );
                    },
                    animationType: DialogTransitionType.size,
                    curve: Curves.fastOutSlowIn,
                  );
                } else if (state.isError) {
                  Navigator.of(context).pop();
                  showAnimatedDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ClassicGeneralDialogWidget(
                        titleText: 'Error!',
                        contentText: state.message,
                        positiveText: 'Okay',
                        onPositiveClick: () {
                          Navigator.of(context).pop();
                        },
                      );
                    },
                    animationType: DialogTransitionType.size,
                    curve: Curves.fastOutSlowIn,
                  );
                } else if (state.isSubmitting) {
                  showAnimatedDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Container(
                          height: 100.0,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    },
                    animationType: DialogTransitionType.size,
                    curve: Curves.fastOutSlowIn,
                  );
                }
              },
              builder: (context, state) {
                if (state.isFormValid &&
                    context.watch<OrderCustDetailsBloc>().state.status ==
                        FormzStatus.valid) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<CheckOutBloc>()..add(ProceedCheckOut());
                    },
                    child: Text('Add Order'),
                  );
                }
                return ElevatedButton(
                  onPressed: null,
                  child: Text('Add Order'),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
