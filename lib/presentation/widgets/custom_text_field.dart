import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required TextEditingController controller,
    required String labelText,
    TextInputAction? textInputAction,
    Widget? prefixIcon,
    TextInputType? keyBoardType,
    int? minLines,
    int? maxLines,
    String? Function(String?)? validator,
  })  : _controller = controller,
        _labelText = labelText,
        _prefixIcon = prefixIcon,
        _textInputAction = textInputAction,
        _keyboardType = keyBoardType,
        _minLines = minLines,
        _maxLines = maxLines,
        _validator = validator,
        super(key: key);

  final TextEditingController _controller;
  final String _labelText;
  final Widget? _prefixIcon;
  final TextInputAction? _textInputAction;
  final TextInputType? _keyboardType;
  final int? _minLines;
  final int? _maxLines;
  final String? Function(String?)? _validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: _textInputAction,
      keyboardType: _keyboardType,
      controller: _controller,
      minLines: _minLines,
      maxLines: _maxLines,
      decoration: InputDecoration(
        labelText: _labelText,
        prefixIcon: _prefixIcon,
        suffixIcon: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            _controller.clear();
          },
        ),
      ),
      validator: _validator,
    );
  }
}
