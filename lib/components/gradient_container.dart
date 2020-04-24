import 'package:flutter/material.dart';
import 'package:gotta_go_fast/themes/app_themes.dart';
import 'package:provider/provider.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final EdgeInsets padding;
  const GradientContainer({Key key, @required this.child, this.width, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              
              Provider.of<AppThemes>(context).gradientStartColor,
              Provider.of<AppThemes>(context).gradientEndColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Container(
          child: child
        )
    );
  }
}