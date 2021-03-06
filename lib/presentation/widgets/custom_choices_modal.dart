import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CustomFieldModalChoices extends StatelessWidget {
  const CustomFieldModalChoices({
    Key? key,
    required TextEditingController controller,
    required Widget builder,
    required String labelText,
    required Widget prefixIcon,
    required Widget suffixIcon,
    final TextInputAction? textInputAction,
    final AutovalidateMode? autovalidateMode,
    final String? Function(String?)? validator,
  })  : _controller = controller,
        _labelText = labelText,
        _builder = builder,
        _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        _textInputAction = textInputAction,
        _autovalidateMode = autovalidateMode,
        _validator = validator,
        super(key: key);

  final TextEditingController _controller;
  final Widget _builder;
  final String _labelText;
  final Widget _prefixIcon;
  final Widget _suffixIcon;
  final TextInputAction? _textInputAction;
  final AutovalidateMode? _autovalidateMode;
  final String? Function(String?)? _validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: _textInputAction,
      autovalidateMode: _autovalidateMode,
      readOnly: true,
      keyboardType: TextInputType.none,
      onTap: () {
        showMaterialModalBottomSheet(
          context: context,
          builder: (_) => _builder,
        );
      },
      controller: _controller,
      decoration: InputDecoration(
        labelText: _labelText,
        prefixIcon: _prefixIcon,
        suffixIcon: _suffixIcon,
      ),
      validator: _validator,
    );
  }
}
