import 'package:delicious_ordering/common_bloc/app_init_bloc/app_init_bloc.dart';
import 'package:delicious_ordering/common_bloc/app_init_bloc/app_init_state.dart';
import 'package:delicious_ordering/presentation/pages/login/components/login_form.dart';
import 'package:delicious_ordering/presentation/pages/login/components/login_header.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_url_dialog.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.1,
              0.4,
              // 0.6,
              // 0.9,
            ],
            colors: [
              Colors.yellow,
              Colors.yellowAccent,
            ],
          )),
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Expanded(flex: 2, child: LoginHeader()),
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            child: LoginForm(),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: FractionalOffset.bottomLeft,
                            child: Padding(
                                padding:
                                    EdgeInsets.only(bottom: 10.0, left: 10.0),
                                child: BlocBuilder<AppInitBloc, AppInitState>(
                                  builder: (context, state) {
                                    if (state is AddedNewURlState) {
                                      return TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Colors.red,
                                          textStyle: TextStyle(
                                              fontSize: 10.0,
                                              letterSpacing: .5,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        onPressed: () {
                                          showAnimatedDialog(
                                            context: context,
                                            builder: (_) {
                                              return AddUrlDialog(
                                                loginContext: context,
                                              );
                                            },
                                            animationType:
                                                DialogTransitionType.size,
                                            curve: Curves.fastOutSlowIn,
                                          );
                                        },
                                        child:
                                            Text('Connected to: ${state.url}'),
                                      );
                                    }
                                    return TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.red,
                                        textStyle: TextStyle(
                                            fontSize: 10.0,
                                            letterSpacing: .5,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      onPressed: () {
                                        showAnimatedDialog(
                                          context: context,
                                          builder: (_) {
                                            return AddUrlDialog(
                                              loginContext: context,
                                            );
                                          },
                                          animationType:
                                              DialogTransitionType.size,
                                          curve: Curves.fastOutSlowIn,
                                        );
                                      },
                                      child: Text('No Url!'),
                                    );
                                  },
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
