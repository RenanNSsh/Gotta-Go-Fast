import 'package:flutter/cupertino.dart';

class CPUModel{
  String name;
  String description;
  double frequency;
  int coreAmout;
  int cacheSize;
  int flops;

  CPUModel({
   @required this.name,
   this.description,
   this.frequency,
   this.coreAmout,
   this.cacheSize,
   this.flops
  });
}