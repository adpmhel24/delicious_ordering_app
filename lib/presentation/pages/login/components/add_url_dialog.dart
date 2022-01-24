import 'package:delicious_ordering/common_bloc/app_init_bloc/bloc.dart';
import 'package:delicious_ordering/configs/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddUrlDialog extends StatefulWidget {
  final BuildContext loginContext;
  const AddUrlDialog({
    Key? key,
    required this.loginContext,
  }) : super(key: key);

  @override
  State<AddUrlDialog> createState() => _AddUrlDialogState();
}

class _AddUrlDialogState extends State<AddUrlDialog> {
  TextEditingController _urlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getTheCurrentURL();
    super.initState();
  }

  getTheCurrentURL() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _urlController.text = prefs.getString("url") ?? "";
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<AppInitBloc>(widget.loginContext),
      child: Builder(builder: (context) {
        return AlertDialog(
          title: Text('Add URL'),
          content: SizedBox(
            height: SizeConfig.screenHeight / 5.3,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _urlController,
                    decoration: InputDecoration(
                      labelText: 'URL',
                      prefixIcon: Icon(Icons.http),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field!';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AppInitBloc>()
                          ..add(
                            AddingNewURL(_urlController.text),
                          );
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Add'),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
