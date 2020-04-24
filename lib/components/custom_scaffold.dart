import 'package:flutter/material.dart';
import 'package:gotta_go_fast/components/bottom_bar.dart';
import 'package:gotta_go_fast/components/custom_app_bar.dart';
import 'package:gotta_go_fast/components/custom_floating_action_button.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  const CustomScaffold({Key key, @required this.title, @required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title,),
      bottomNavigationBar: BottomBar(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActionButton(),
      // backgroundColor: Color(0XFF0e0e0e),
      body: body,
    );
  }
}