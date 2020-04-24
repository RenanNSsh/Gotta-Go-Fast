import 'package:gotta_go_fast/extensions/string_extension.dart';

class DeveloperModel{
  String iconUrl;
  String name;
  DeveloperModel({
    this.iconUrl,
    this.name
  }){
    if(this.name.toLowerCase() == this.name){
      this.name = this.name.firstLetterToUpperCase;
    }
  }
}