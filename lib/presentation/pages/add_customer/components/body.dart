import 'package:delicious_ordering/data/models/models.dart';
import 'package:delicious_ordering/data/repositories/repositories.dart';
import 'package:delicious_ordering/presentation/pages/add_customer/bloc/add_customer_bloc.dart';
import 'package:delicious_ordering/presentation/pages/add_customer/bloc/add_customer_event.dart';
import 'package:delicious_ordering/presentation/pages/add_customer/bloc/add_customer_state.dart';
import 'package:delicious_ordering/presentation/pages/add_order/ordering_home.dart';
import 'package:delicious_ordering/presentation/widgets/custom_choices_modal.dart';
import 'package:delicious_ordering/presentation/widgets/custom_error_dialog.dart';
import 'package:delicious_ordering/presentation/widgets/custom_loading_dialog.dart';
import 'package:delicious_ordering/presentation/widgets/custom_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _codeController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _custTypeController = TextEditingController();
  TextEditingController _custAddressController = TextEditingController();
  TextEditingController _custContactNumberController = TextEditingController();

  List<CustomerDetailsModel> details = [];

  @override
  void dispose() {
    _codeController.dispose();
    _nameController.dispose();
    _custTypeController.dispose();
    _custAddressController.dispose();
    _custContactNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CustomerTypeRepo _custTypeRepo = AppRepo.customerTypeRepository;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: BlocConsumer<AddCustomerBloc, AddCustomerState>(
            listener: (context, state) {
              if (state.status.isSubmissionInProgress) {
                customLoadingDialog(context);
              } else if (state.status.isSubmissionFailure) {
                customErrorDialog(context, state.message!);
              } else if (state.status.isSubmissionSuccess) {
                customSuccessDialog(
                    context: context,
                    message: state.message!,
                    onPositiveClick: () {
                      Navigator.of(context)
                          .popAndPushNamed(OrderingHomePage.routeName);
                    });
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _customerCodeField(context, state),
                  _customerNameField(context, state),
                  CustomerTypeModal(
                      custTypeController: _custTypeController,
                      custTypeRepo: _custTypeRepo,
                      state: state),
                  _customerAddressField(context, state),
                  _customerContactNumber(context, state),
                  SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                      onPressed: (state.status.isValidated)
                          ? () {
                              context.read<AddCustomerBloc>()
                                ..add(PostNewCustomer());
                            }
                          : null,
                      child: Text('Add Customer')),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _CustomField _customerContactNumber(
      BuildContext context, AddCustomerState state) {
    return _CustomField(
      autovalidateMode: AutovalidateMode.always,
      textInputAction: TextInputAction.done,
      keyBoardType: TextInputType.phone,
      controller: _custContactNumberController,
      labelText: 'Customer Contact Number',
      prefixIcon: Icon(Icons.phone),
      suffixIcon: IconButton(
        onPressed: () {
          _custContactNumberController.clear();
          context.read<AddCustomerBloc>()
            ..add(ChangeCustContactNumber(_custContactNumberController.text));
        },
        icon: Icon(Icons.close),
      ),
      validator: (_) {
        return (state.contactNumber.invalid) ? "Required field!" : null;
      },
      onChanged: (value) {
        context.read<AddCustomerBloc>()
          ..add(ChangeCustContactNumber(_custContactNumberController.text));
      },
    );
  }

  _CustomField _customerAddressField(
      BuildContext context, AddCustomerState state) {
    return _CustomField(
      autovalidateMode: AutovalidateMode.always,
      textInputAction: TextInputAction.newline,
      minLines: 3,
      maxLines: 6,
      controller: _custAddressController,
      labelText: 'Customer Address',
      prefixIcon: Icon(Icons.home),
      suffixIcon: IconButton(
        onPressed: () {
          _custAddressController.clear();
          context.read<AddCustomerBloc>()
            ..add(ChangeCustAddress(_custAddressController.text));
        },
        icon: Icon(Icons.close),
      ),
      validator: (_) {
        return (state.address.invalid) ? "Required field!" : null;
      },
      onChanged: (value) {
        context.read<AddCustomerBloc>()
          ..add(ChangeCustAddress(_custAddressController.text));
      },
    );
  }

  _CustomField _customerNameField(
      BuildContext context, AddCustomerState state) {
    return _CustomField(
      autovalidateMode: AutovalidateMode.always,
      textInputAction: TextInputAction.next,
      controller: _nameController,
      labelText: 'Customer Name',
      prefixIcon: Icon(Icons.person),
      suffixIcon: IconButton(
        onPressed: () {
          _nameController.clear();
          context.read<AddCustomerBloc>()
            ..add(ChangeCustomerName(_nameController.text));
        },
        icon: Icon(Icons.close),
      ),
      validator: (_) {
        return (state.name.invalid) ? "Required field!" : null;
      },
      onChanged: (value) {
        context.read<AddCustomerBloc>()
          ..add(ChangeCustomerName(_nameController.text));
      },
    );
  }

  _CustomField _customerCodeField(
      BuildContext context, AddCustomerState state) {
    return _CustomField(
      autovalidateMode: AutovalidateMode.always,
      textInputAction: TextInputAction.next,
      controller: _codeController,
      labelText: 'Customer Code',
      prefixIcon: Icon(Icons.person),
      suffixIcon: IconButton(
        onPressed: () {
          _codeController.clear();
          context.read<AddCustomerBloc>()
            ..add(ChangeCustomerCode(_codeController.text));
        },
        icon: Icon(Icons.close),
      ),
      validator: (_) {
        return (state.code.invalid) ? "Required field!" : null;
      },
      onChanged: (value) {
        context.read<AddCustomerBloc>()
          ..add(ChangeCustomerCode(_codeController.text));
      },
    );
  }
}

class CustomerTypeModal extends StatelessWidget {
  const CustomerTypeModal({
    Key? key,
    required TextEditingController custTypeController,
    required CustomerTypeRepo custTypeRepo,
    required this.state,
  })  : _custTypeController = custTypeController,
        _custTypeRepo = custTypeRepo,
        super(key: key);

  final TextEditingController _custTypeController;
  final CustomerTypeRepo _custTypeRepo;
  final AddCustomerState state;

  @override
  Widget build(BuildContext context) {
    return CustomFieldModalChoices(
      autovalidateMode: AutovalidateMode.always,
      controller: _custTypeController,
      builder: ListView.builder(
          shrinkWrap: true,
          itemCount: _custTypeRepo.customerTypes.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(_custTypeRepo.customerTypes[index].name),
              selected: _custTypeController.text ==
                  _custTypeRepo.customerTypes[index].name,
              onTap: () {
                _custTypeController.text =
                    _custTypeRepo.customerTypes[index].name;
                context.read<AddCustomerBloc>()
                  ..add(ChangeCustomerType(
                      _custTypeRepo.customerTypes[index].id.toString()));
                Navigator.of(context).pop();
              },
            );
          }),
      labelText: 'Customer Type',
      prefixIcon: Icon(Icons.group),
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              await _custTypeRepo.fetchCustomerType();
              this._custTypeController.clear();
              context.read<AddCustomerBloc>()..add(ChangeCustomerType(''));
            },
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              this._custTypeController.clear();
              context.read<AddCustomerBloc>()..add(ChangeCustomerType(''));
            },
          ),
        ],
      ),
      validator: (_) {
        return (state.custType.invalid) ? "Required field!" : null;
      },
    );
  }
}

class _CustomField extends StatelessWidget {
  const _CustomField({
    Key? key,
    required TextEditingController controller,
    required String labelText,
    TextInputAction? textInputAction,
    Widget? prefixIcon,
    Widget? suffixIcon,
    TextInputType? keyBoardType,
    int? minLines,
    int? maxLines,
    String? Function(String?)? validator,
    void Function(String?)? onChanged,
    AutovalidateMode? autovalidateMode,
  })  : _controller = controller,
        _labelText = labelText,
        _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        _textInputAction = textInputAction,
        _keyboardType = keyBoardType,
        _minLines = minLines,
        _maxLines = maxLines,
        _validator = validator,
        _onChanged = onChanged,
        _autovalidateMode = autovalidateMode,
        super(key: key);

  final TextEditingController _controller;
  final String _labelText;
  final Widget? _prefixIcon;
  final Widget? _suffixIcon;
  final TextInputAction? _textInputAction;
  final TextInputType? _keyboardType;
  final int? _minLines;
  final int? _maxLines;
  final String? Function(String?)? _validator;
  final void Function(String?)? _onChanged;
  final AutovalidateMode? _autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: _autovalidateMode,
      textInputAction: _textInputAction,
      keyboardType: _keyboardType,
      controller: _controller,
      minLines: _minLines,
      maxLines: _maxLines,
      decoration: InputDecoration(
        labelText: _labelText,
        prefixIcon: _prefixIcon,
        suffixIcon: _suffixIcon,
      ),
      validator: _validator,
      onChanged: _onChanged,
    );
  }
}
