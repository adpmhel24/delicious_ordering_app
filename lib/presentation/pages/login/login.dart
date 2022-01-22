import 'package:delicious_ordering/presentation/pages/login/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class LoginPage extends StatelessWidget {
  static final String routeName = '/login';

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Body(),
    );
  }
}
