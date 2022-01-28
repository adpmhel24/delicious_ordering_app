import 'package:delicious_ordering/common_bloc/app_init_bloc/bloc.dart';
import 'package:delicious_ordering/presentation/pages/login/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'components/add_url_dialog.dart';

class LoginPage extends StatelessWidget {
  static final String routeName = '/login';

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  const LoginPage({Key? key}) : super(key: key);
  // final Function(bool loggedIn) onLoginCallback;

  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider(
  //     create: (context) => LoginBloc(),
  //     child: BlocConsumer<AppInitBloc, AppInitState>(
  //       listener: (context, state) {
  //         if (state is )
  //       },
  //       builder: (context, state) => Body(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => AppInitBloc()..add(OpeningApp()),
        ),
      ],
      child: Builder(
        builder: (BuildContext builderContext) {
          return BlocConsumer<AppInitBloc, AppInitState>(
            listener: (_, state) {
              if (state is NoURLState) {
                showAnimatedDialog(
                  context: context,
                  builder: (_) {
                    return AddUrlDialog(
                      loginContext: builderContext,
                    );
                  },
                  animationType: DialogTransitionType.size,
                  curve: Curves.fastOutSlowIn,
                );
              }
            },
            builder: (_, state) => Body(),
          );
        },
      ),
    );
  }
}
