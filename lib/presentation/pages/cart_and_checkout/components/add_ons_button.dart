import 'package:delicious_ordering/common_bloc/cart_bloc/bloc.dart';
import 'package:delicious_ordering/common_bloc/disc_type_bloc/bloc.dart';
import 'package:delicious_ordering/data/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AddOnButtons extends StatefulWidget {
  final CartRepo _cartRepo;
  const AddOnButtons({
    Key? key,
    required CartRepo cartRepo,
  })  : _cartRepo = cartRepo,
        super(key: key);

  @override
  _AddOnButtonsState createState() => _AddOnButtonsState();
}

class _AddOnButtonsState extends State<AddOnButtons> {
  TextEditingController _discAmountController = TextEditingController();
  TextEditingController _delFeeController = TextEditingController();
  TextEditingController _tenderAmntController = TextEditingController();

  @override
  void dispose() {
    _discAmountController.dispose();
    _delFeeController.dispose();
    _tenderAmntController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _discAmountController.text = widget._cartRepo.discount.toString();
    _delFeeController.text = widget._cartRepo.delfee.toString();
    _tenderAmntController.text = widget._cartRepo.tenderedAmnt.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // DiscountTypeRepo _discountTypeRepo = AppRepo.discTypeRepository;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AddOnButton(
              label: 'Add Delivery Fee',
              icon: Icon(Icons.delivery_dining),
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return CustomizedDialog(
                        title: 'Add Delivery Fee',
                        controller: _delFeeController,
                        onPressed: () {
                          context.read<CartBloc>().add(
                                UpdateDeliveryFee(
                                  double.parse(_delFeeController.text.isEmpty
                                      ? '0'
                                      : _delFeeController.text),
                                ),
                              );
                          Navigator.of(context).pop();
                        },
                      );
                    });
              },
            ),
            SizedBox(
              width: 10,
            ),
            // AddOnButton(
            //   label: 'Add Discount Amount',
            //   icon: Icon(Icons.money_off),
            //   onPressed: () {
            //     context.read<DiscTypeBloc>()..add(FetchDiscTypeFromLocal());
            //     showDialog(
            //         barrierDismissible: false,
            //         context: context,
            //         builder: (BuildContext context) {
            //           return DiscountDialog(
            //             title: 'Add Discount Amount',
            //             discountController: _discAmountController,
            //             discountTypeRepo: _discountTypeRepo,
            //             onPressed: () {
            //               context.read<CartBloc>().add(
            //                     UpdateDiscount(
            //                       double.parse(
            //                           _discAmountController.text.isEmpty
            //                               ? '0'
            //                               : _discAmountController.text),
            //                     ),
            //                   );
            //               Navigator.of(context).pop();
            //             },
            //           );
            //         });
            //   },
            // ),
            SizedBox(
              width: 10,
            ),
            AddOnButton(
              label: 'Add Tendered Amount',
              icon: Icon(Icons.monetization_on),
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return CustomizedDialog(
                        title: 'Add Tendered Amount',
                        controller: _tenderAmntController,
                        onPressed: () {
                          context.read<CartBloc>().add(
                                UpdateTenderedAmount(
                                  double.parse(
                                      _tenderAmntController.text.isEmpty
                                          ? '0'
                                          : _tenderAmntController.text),
                                ),
                              );
                          Navigator.of(context).pop();
                        },
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Buttons

class AddOnButton extends StatelessWidget {
  const AddOnButton({
    Key? key,
    required String label,
    required Widget icon,
    required void Function() onPressed,
  })  : _label = label,
        _icon = icon,
        _onPressed = onPressed,
        super(key: key);

  // final CartRepo _cartRepo;
  final void Function() _onPressed;
  final String _label;
  final Widget _icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _onPressed,
      icon: _icon,
      label: Text(
        _label,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        primary: Color(0xFFB762C1),
      ),
    );
  }
}

class CustomizedDialog extends StatelessWidget {
  final TextEditingController _controller;
  final void Function() _onPressed;
  final String _title;

  CustomizedDialog({
    required String title,
    required TextEditingController controller,
    required void Function() onPressed,
  })  : _controller = controller,
        _onPressed = onPressed,
        _title = title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_title),
      content: Container(
        height: 100,
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _controller,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    child: Text('Close'),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: _onPressed,
                    child: Text('Add'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DiscountDialog extends StatefulWidget {
  final TextEditingController _discountController;
  final DiscountTypeRepo _discountTypeRepo;
  final void Function() _onPressed;
  final String _title;

  DiscountDialog({
    required String title,
    required void Function() onPressed,
    required TextEditingController discountController,
    required DiscountTypeRepo discountTypeRepo,
  })  : _onPressed = onPressed,
        _discountController = discountController,
        _discountTypeRepo = discountTypeRepo,
        _title = title;

  @override
  State<DiscountDialog> createState() => _DiscountDialogState();
}

class _DiscountDialogState extends State<DiscountDialog> {
  TextEditingController _discountTypeController = TextEditingController();

  bool _isDiscountAmntActive = false;

  void onDiscountTypeChange() {
    if (_discountTypeController.text.isEmpty) {
      setState(() {
        _isDiscountAmntActive = false;
      });
    } else {
      setState(() {
        _isDiscountAmntActive = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget._title),
      content: Container(
        height: 200,
        child: Form(
          child: Column(
            children: [
              BlocBuilder<DiscTypeBloc, DiscTypeState>(
                builder: (context, state) {
                  return TypeAheadFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                      textInputAction: TextInputAction.next,
                      controller: _discountTypeController,
                      maxLines: 2,
                      decoration: InputDecoration(
                        labelText: 'Discount Type',
                        prefixIcon: Icon(Icons.money_sharp),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.refresh),
                              onPressed: () {
                                _discountTypeController.clear();
                                context.read<DiscTypeBloc>()
                                  ..add(FetchDiscTypeFromAPI());
                                onDiscountTypeChange();
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                this._discountTypeController.clear();
                                onDiscountTypeChange();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    suggestionsCallback:
                        widget._discountTypeRepo.getSuggestions,
                    itemBuilder: (context, dynamic discTypTypes) {
                      return ListTile(
                        title: Text(discTypTypes.description),
                      );
                    },
                    transitionBuilder: (context, suggestionsBox, controller) {
                      return suggestionsBox;
                    },
                    onSuggestionSelected: (dynamic discTypTypes) {
                      this._discountTypeController.text =
                          discTypTypes.description;
                      onDiscountTypeChange();
                    },
                  );
                },
              ),
              TextFormField(
                controller: widget._discountController,
                readOnly: !_isDiscountAmntActive,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    child: Text('Close'),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: widget._onPressed,
                    child: Text('Add'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
