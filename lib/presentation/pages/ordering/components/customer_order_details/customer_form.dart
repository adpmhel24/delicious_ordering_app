import 'package:delicious_ordering/common_bloc/cust_type_bloc/cust_type_bloc.dart';
import 'package:delicious_ordering/common_bloc/cust_type_bloc/cust_type_event.dart';
import 'package:delicious_ordering/common_bloc/cust_type_bloc/cust_type_state.dart';
import 'package:delicious_ordering/common_bloc/customer_bloc/bloc.dart';
import 'package:delicious_ordering/configs/size_config.dart';
import 'package:delicious_ordering/data/repositories/repositories.dart';
import 'package:delicious_ordering/presentation/pages/ordering/components/customer_order_details/bloc/bloc.dart';
import 'package:delicious_ordering/presentation/widgets/custom_choices_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:line_icons/line_icons.dart';

class CustomerOrderingDetailsForm extends StatefulWidget {
  const CustomerOrderingDetailsForm({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => CustomerOrderingDetailsForm());
  }

  @override
  State<CustomerOrderingDetailsForm> createState() =>
      _CustomerOrderingDetailsFormState();
}

class _CustomerOrderingDetailsFormState
    extends State<CustomerOrderingDetailsForm> {
  CheckOutRepo _checkOutRepo = AppRepo.checkOutRepository;
  TextEditingController _custCodeController = TextEditingController();
  TextEditingController _contactNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _custTypeController = TextEditingController();

  @override
  void initState() {
    _custTypeController.text = (_checkOutRepo.checkoutData.custType == null)
        ? ''
        : _checkOutRepo.checkoutData.custType!;

    _custCodeController.text = (_checkOutRepo.checkoutData.custCode == null)
        ? ''
        : _checkOutRepo.checkoutData.custCode!;

    _contactNumberController.text =
        (_checkOutRepo.checkoutData.contactNumber == null)
            ? ''
            : _checkOutRepo.checkoutData.contactNumber!;
    _addressController.text = (_checkOutRepo.checkoutData.address == null)
        ? ''
        : _checkOutRepo.checkoutData.address!;
    super.initState();
  }

  @override
  void dispose() {
    _custCodeController.dispose();
    _contactNumberController.dispose();
    _custTypeController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CustomerRepo _custRepo = AppRepo.customerRepository;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.defaultSize * 3,
            vertical: SizeConfig.defaultSize),
        // padding: EdgeInsets.symmetric(
        //   horizontal: SizeConfig.defaultPadding,
        //   vertical: SizeConfig.defaultSize * 4,
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomerTypeField(custTypeController: _custTypeController),
              CustomerNameTypeAheadField(
                custNameController: _custCodeController,
                contactNumberController: _contactNumberController,
                addressController: _addressController,
                custRepo: _custRepo,
              ),
              ContactNumberField(phoneNumController: _contactNumberController),
              AddressField(addressController: _addressController),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressField extends StatelessWidget {
  const AddressField({
    Key? key,
    required TextEditingController addressController,
  })  : _addressController = addressController,
        super(key: key);

  final TextEditingController _addressController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCustDetailsBloc, OrderCustDetailsState>(
        buildWhen: (prevState, currState) =>
            prevState.address != currState.address,
        builder: (_, state) {
          return TextFormField(
            autovalidateMode: AutovalidateMode.always,
            keyboardType: TextInputType.multiline,
            controller: _addressController,
            minLines: 3,
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'Delivery Address',
              prefixIcon: Icon(LineIcons.home),
              suffixIcon: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  this._addressController.clear();
                  context.read<OrderCustDetailsBloc>()
                    ..add(ChangeAddress(_addressController));
                },
              ),
            ),
            onChanged: (value) {
              context.read<OrderCustDetailsBloc>()
                ..add(ChangeAddress(_addressController));
            },
            validator: (_) {
              return (state.address.invalid) ? "Required field!" : null;
            },
          );
        });
  }
}

class ContactNumberField extends StatelessWidget {
  const ContactNumberField({
    Key? key,
    required TextEditingController phoneNumController,
  })  : _contactNumberController = phoneNumController,
        super(key: key);

  final TextEditingController _contactNumberController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCustDetailsBloc, OrderCustDetailsState>(
        builder: (_, state) {
      return TextFormField(
        autovalidateMode: AutovalidateMode.always,
        keyboardType: TextInputType.phone,
        controller: _contactNumberController,
        decoration: InputDecoration(
          labelText: 'Contact Number',
          prefixIcon: Icon(LineIcons.phone),
          suffixIcon: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              this._contactNumberController.clear();
              context.read<OrderCustDetailsBloc>()
                ..add(ChangeContactNumber(_contactNumberController));
            },
          ),
        ),
        onChanged: (value) {
          context.read<OrderCustDetailsBloc>()
            ..add(ChangeContactNumber(_contactNumberController));
        },
        validator: (_) {
          return (state.contactNumber.invalid) ? "Required field!" : null;
        },
      );
    });
  }
}

class CustomerTypeField extends StatelessWidget {
  const CustomerTypeField({
    Key? key,
    required TextEditingController custTypeController,
  })  : _custTypeController = custTypeController,
        super(key: key);

  final TextEditingController _custTypeController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustTypeBloc, CustTypeState>(
      builder: (_, state) {
        if (state is CustTypeLoadedState) {
          return CustomFieldModalChoices(
            controller: _custTypeController,
            builder: ListView.separated(
              shrinkWrap: true,
              itemCount: state.custTypes.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(state.custTypes[index].name),
                  selected:
                      _custTypeController.text == state.custTypes[index].name,
                  onTap: () {
                    _custTypeController.text = state.custTypes[index].name;
                    context.read<OrderCustDetailsBloc>()
                      ..add(ChangeCustType(_custTypeController.text));
                    context.read<CustomerBloc>()
                      ..add(
                          FilterCustomerByCustType(state.custTypes[index].id));
                    Navigator.of(context).pop();
                  },
                );
              },
              separatorBuilder: (_, index) {
                return Divider(
                  thickness: 1,
                );
              },
            ),
            labelText: 'Customer Type',
            prefixIcon: Icon(Icons.group),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () async {
                    context.read<CustTypeBloc>()..add(FetchCustTypeFromAPI());
                    this._custTypeController.clear();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    this._custTypeController.clear();
                  },
                ),
              ],
            ),
          );
        } else
          return TextFormField(
            decoration: InputDecoration(
              labelText: 'Customer Type',
              prefixIcon: Icon(Icons.group),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () async {
                      context.read<CustTypeBloc>()..add(FetchCustTypeFromAPI());
                      this._custTypeController.clear();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      this._custTypeController.clear();
                    },
                  ),
                ],
              ),
            ),
          );
      },
    );
  }
}

class CustomerNameTypeAheadField extends StatelessWidget {
  const CustomerNameTypeAheadField({
    Key? key,
    required TextEditingController custNameController,
    required TextEditingController contactNumberController,
    required TextEditingController addressController,
    required CustomerRepo custRepo,
  })  : _custCodeController = custNameController,
        _contactNumberController = contactNumberController,
        _addressController = addressController,
        _custRepo = custRepo,
        super(key: key);

  final TextEditingController _custCodeController;
  final TextEditingController _contactNumberController;
  final TextEditingController _addressController;
  final CustomerRepo _custRepo;

  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField(
      autovalidateMode: AutovalidateMode.always,
      textFieldConfiguration: TextFieldConfiguration(
        textInputAction: TextInputAction.next,
        controller: this._custCodeController,
        decoration: InputDecoration(
          labelText: 'Customer Code',
          prefixIcon: Icon(Icons.person),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  this._custCodeController.clear();
                  context.read<CustomerBloc>()..add(FetchCustomerFromAPI());
                },
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  this._custCodeController.clear();
                  this._contactNumberController.clear();
                  this._addressController.clear();
                  context.read<OrderCustDetailsBloc>()
                    ..add(ChangeCustCode(this._custCodeController.text));
                  context.read<OrderCustDetailsBloc>()
                    ..add(ChangeContactNumber(this._contactNumberController));
                  context.read<OrderCustDetailsBloc>()
                    ..add(ChangeAddress(this._addressController));
                },
              ),
            ],
          ),
        ),
      ),
      suggestionsCallback: _custRepo.getSuggestions,
      itemBuilder: (context, dynamic customer) {
        return ListTile(
          title: Text(customer.name),
        );
      },
      transitionBuilder: (context, suggestionsBox, controller) {
        return suggestionsBox;
      },
      onSuggestionSelected: (dynamic selectedCustomer) {
        this._custCodeController.text = selectedCustomer.name;
        this._contactNumberController.text =
            (selectedCustomer.contactNumber == null)
                ? ''
                : selectedCustomer.contactNumber;
        this._addressController.text =
            (selectedCustomer.address == null) ? '' : selectedCustomer.address;

        context.read<OrderCustDetailsBloc>()
          ..add(ChangeCustCode(this._custCodeController.text));
        context.read<OrderCustDetailsBloc>()
          ..add(ChangeContactNumber(this._contactNumberController));
        context.read<OrderCustDetailsBloc>()
          ..add(ChangeAddress(this._addressController));
      },
      validator: (_) {
        if (context.read<OrderCustDetailsBloc>().state.custCode.invalid) {
          return "Required field!";
        }
        return null;
      },
    );
  }
}
