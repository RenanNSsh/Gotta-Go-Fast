import 'package:flutter/material.dart';
import 'package:gotta_go_fast/screens/cpu_detail.dart';
import 'package:gotta_go_fast/screens/cpu_list.dart';

var routes = {
  '/': (BuildContext context) => CPUList(),
  '/cpu_detail': (BuildContext context) => CPUDetailScreen()
};