import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../bloc/bloc.dart';

class CheckOutForm extends StatefulWidget {
  const CheckOutForm({Key? key}) : super(key: key);

  @override
  _CheckOutFormState createState() => _CheckOutFormState();
}

class _CheckOutFormState extends State<CheckOutForm> {
  TextEditingController _dateTimeController = TextEditingController();
  TextEditingController _deliveryMethod = TextEditingController();
  TextEditingController _paymentMethod = TextEditingController();
  TextEditingController _orderNotes = TextEditingController();

  DateFormat dateFormat = DateFormat("MM/dd/yyyy");

  @override
  void dispose() {
    _deliveryMethod.dispose();
    _paymentMethod.dispose();
    _orderNotes.dispose();
    _dateTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          DeliveryDateField(
            controller: _dateTimeController,
            dateFormat: dateFormat,
          ),
          FormBuilderChoiceChip(
            alignment: WrapAlignment.spaceEvenly,
            name: 'delivery_method_chips',
            backgroundColor: Color(0xFFFFF1BD),
            selectedColor: Color(0xFFA3DA8D),
            decoration: InputDecoration(
              labelText: 'Delivery Methods',
            ),
            onChanged: (value) {
              context.read<CheckOutBloc>()
                ..add(DeliveryMethodChange(value.toString()));
            },
            options: [
              FormBuilderFieldOption(
                value: 'Pickup',
                child: Text(
                  'Pick Up',
                ),
              ),
              FormBuilderFieldOption(
                value: 'Delivery',
                child: Text(
                  'Delivery',
                ),
              ),
            ],
          ),
          FormBuilderChoiceChip(
            alignment: WrapAlignment.spaceEvenly,
            name: 'payment_method_chips',
            backgroundColor: Color(0xFFFFF1BD),
            selectedColor: Color(0xFFA3DA8D),
            decoration: InputDecoration(
              labelText: 'Payment Methods',
            ),
            onChanged: (value) {
              context.read<CheckOutBloc>()
                ..add(PaymentMethodChange(
                    (value == null) ? '' : value.toString()));
            },
            options: [
              FormBuilderFieldOption(
                value: 'COD',
                child: Text(
                  'Cash On Delivery',
                ),
              ),
              FormBuilderFieldOption(
                value: 'OnlineBanking',
                child: Text(
                  'Online Banking',
                ),
              ),
              FormBuilderFieldOption(
                value: 'GCash',
                child: Text(
                  'GCash',
                ),
              ),
              FormBuilderFieldOption(
                value: 'PayMaya',
                child: Text(
                  'PayMaya',
                ),
              ),
            ],
          ),
          RemarksField(
            controller: _orderNotes,
          ),
        ],
      ),
    );
  }
}

class RemarksField extends StatelessWidget {
  final TextEditingController _controller;

  const RemarksField({
    Key? key,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.newline,
      minLines: 3,
      maxLines: 6,
      textAlign: TextAlign.left,
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Order Notes',
        prefixIcon: Icon(Icons.note_add),
        suffixIcon: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            this._controller.clear();
          },
        ),
      ),
      onChanged: (value) {
        context.read<CheckOutBloc>()..add(CheckOutNotesChange(value));
      },
    );
  }
}

class DeliveryDateField extends StatelessWidget {
  final TextEditingController _controller;
  final DateFormat _dateFormat;

  const DeliveryDateField({
    Key? key,
    required TextEditingController controller,
    required DateFormat dateFormat,
  })  : _controller = controller,
        _dateFormat = dateFormat,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: _controller,
      showCursor: false,
      readOnly: true,
      onTap: () {
        DatePicker.showDatePicker(
          context,
          showTitleActions: true,
          minTime: DateTime(2018, 3, 5),
          maxTime: DateTime(2100, 12, 31),
          onConfirm: (date) {
            _controller.text = '${_dateFormat.format(date)}';
            // _postBody['dateDelivery'] = date.toIso8601String();
            context.read<CheckOutBloc>()
              ..add(DeliveryDateChange(date.toIso8601String()));
          },
          currentTime: DateTime.now(),
          locale: LocaleType.en,
        );
      },
      decoration: InputDecoration(
        labelText: 'Delivery Date*',
        prefixIcon: Icon(Icons.calendar_today),
      ),
    );
  }
}
