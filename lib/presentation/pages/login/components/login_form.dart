import 'package:delicious_ordering/common_bloc/auth_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'package:delicious_ordering/configs/size_config.dart';
import 'package:delicious_ordering/presentation/pages/login/bloc/bloc.dart';
// import 'package:delicious_ordering/presentation/widgets/custom_error.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isHidden = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.message)),
            );
        } else if (state.isLoginSuccess) {
          context.read<AuthBloc>().add(LoggedIn());
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize * 3,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultPadding,
          vertical: SizeConfig.defaultSize * 4,
        ),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _UsernameInput(
                usernameController: _usernameController,
              ),
              SizedBox(height: SizeConfig.defaultSize),
              _PasswordInput(
                passwordController: _passwordController,
                isHidden: isHidden,
                togglePasswordVisibility: togglePasswordVisibility,
              ),
              SizedBox(height: SizeConfig.defaultSize),
              _LoginButton()
            ],
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  final TextEditingController usernameController;
  const _UsernameInput({Key? key, required this.usernameController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextFormField(
          textInputAction: TextInputAction.next,
          controller: usernameController,
          autovalidateMode: AutovalidateMode.always,
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          validator: (_) {
            return (state.username.invalid) ? "Invalid Username" : null;
          },
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.person),
            labelText: "Username",
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  final TextEditingController passwordController;
  final bool isHidden;
  final void Function() togglePasswordVisibility;

  const _PasswordInput(
      {Key? key,
      required this.passwordController,
      required this.isHidden,
      required this.togglePasswordVisibility})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return TextFormField(
            controller: this.passwordController,
            obscureText: this.isHidden,
            textInputAction: TextInputAction.done,
            autovalidateMode: AutovalidateMode.always,
            onChanged: (password) =>
                context.read<LoginBloc>().add(LoginPasswordChanged(password)),
            validator: (_) {
              return (state.password.invalid) ? "Invalid Password" : null;
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: this.togglePasswordVisibility,
                icon: Icon(isHidden
                    ? Icons.visibility_off
                    : Icons.visibility_outlined),
              ),
              labelText: "Password",
            ),
          );
        });
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? ElevatedButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: CircularProgressIndicator()),
                    Text('Logging-In.')
                  ],
                ),
              )
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                child: const Text('Login'),
                onPressed: state.status.isValidated
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
              );
      },
    );
  }
}
