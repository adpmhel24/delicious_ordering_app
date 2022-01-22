import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/add_customer_bloc.dart';
import './components/body.dart';

class AddingCustomerPage extends StatelessWidget {
  static final routeName = '/add_customer';
  const AddingCustomerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Customer'),
      ),
      body: BlocProvider<AddCustomerBloc>(
        create: (context) => AddCustomerBloc(),
        child: Body(),
      ),
    );
  }
}
