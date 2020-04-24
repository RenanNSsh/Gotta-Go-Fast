import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Opacity(
      opacity: keyboardIsOpened ? 0 : 1,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(
            context,
            "/",
          );
        },
        tooltip: 'Clients',
        child: Icon(
          Icons.home,
        ),
        elevation: 2.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}