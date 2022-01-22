import 'package:delicious_ordering/constant/constant.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            appTitleName,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        SizedBox(height: 10.0),
        Center(
          child: Text(
            'Log In',
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}
