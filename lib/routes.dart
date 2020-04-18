import 'package:flutter/material.dart';
import 'package:gotta_go_fast/screens/cpu_list.dart';

var routes = {
  '/': (BuildContext context) => CPUList(),
  '/console_detail': (BuildContext context) => Container(color:Theme.of(context).primaryColor)
};