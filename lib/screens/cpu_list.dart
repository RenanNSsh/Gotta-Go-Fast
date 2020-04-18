import 'package:flutter/material.dart';

class CPUList extends StatelessWidget {
  const CPUList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Processadores'),
        ),
        body: Container(color: Colors.white,),
      ),
    );
  }
}