import 'package:flutter/material.dart';
import 'package:gotta_go_fast/themes/theme_type.dart';

class AppThemes with ChangeNotifier {

  ThemeType type;

  AppThemes({this.type});

  ThemeData _defaultTheme= ThemeData(
      primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
      accentColor: Color(0xffE65829),
  );
  // ThemeData _light = ThemeData.light();
  ThemeData _dark = ThemeData.dark();

  Color get cardColor{
    switch(type){
      case ThemeType.DARK:
        return _defaultTheme.primaryColor;
        break;
      case ThemeType.DEFAULT:
        return Colors.white;
      default:
        return null;
    }
  }

  bool get isInDarkMode => type == ThemeType.DARK;

  Color get gradientStartColor{
    
    switch(type){
      case ThemeType.DARK:
        return Color(0xff202020);
      case ThemeType.DEFAULT:
        return Color(0xfffbfbfb);
      default:
        return null;
    }
  }

  Color get gradientEndColor{
    switch(type){
      case ThemeType.DARK:
        return Color(0xff4a4a4a);
      case ThemeType.DEFAULT:
        return Color(0xfff7f7f7);
      default:
        return null;
    }
  }

  Color get appBarTitleColor{
    switch(type){
      case ThemeType.DARK:
        return Colors.white;
      case ThemeType.DEFAULT:
        return Colors.black;
      default:
        return null;
    }
  }

  Color get cardShadow{
    switch(type){
      case ThemeType.DARK:
        return Color(0xff212121);
      case ThemeType.DEFAULT:
        return const Color(0xfff8f8f8);
      default:
        return null;
    }
  }

  Color get developerCategorySelectedShadow{
    switch(type){
      case ThemeType.DARK:
        return _dark.accentColor.withAlpha(25);
      case ThemeType.DEFAULT:
        return Color(0xfffbf2ef);
      default:
        return null;
    }
  }

  Color get developerCategoryNotSelectedShadow{
    switch(type){
      case ThemeType.DARK:
        return cardShadow;
      case ThemeType.DEFAULT:
        return Colors.white;
      default:
        return null;
    }
  }

  Color get developerCategorySelectedBorder{
    switch(type){
      case ThemeType.DARK:
        return _dark.accentColor;
      case ThemeType.DEFAULT:
    return Color(0xffE65829);
      default:
        return null;
    }

  }

  Color get developerCategoryNotSelectedBorder{
    switch(type){
      case ThemeType.DARK:
        return _defaultTheme.primaryColor;
      case ThemeType.DEFAULT:
        return  Color(0xffA1A3A6);
      default:
        return null;
    }
  }

  Color get developerCategoryNotSelected{
    switch(type){
      case ThemeType.DARK:
        return Colors.white;
      case ThemeType.DEFAULT:
        return  Colors.transparent;
      default:
        return null;
    }
  }

  Color get developerCategorySelected{
    switch(type){
      case ThemeType.DARK:
        return Color(0xfff5f5f5);
      case ThemeType.DEFAULT:
        return Colors.white;
      default:
        return null;
    }
  }

  Color get consoleCardSubtitle{
    switch(type){
      case ThemeType.DARK:
        return _dark.accentColor;
      case ThemeType.DEFAULT:
        return Color(0xffE65829);
      default:
        return null;
    }
  }

  Color get consoleCardTitle{
    
    switch(type){
      case ThemeType.DARK:
        return developerCategorySelected;
      case ThemeType.DEFAULT:
        return _defaultTheme.primaryColor;
      default:
        return null;
    }
  }

  get searchIcon{
    switch(type){
      case ThemeType.DARK:
        return Colors.white54;
      case ThemeType.DEFAULT:
        return Colors.black54;
      default:
        return null;
    }
  }

  get titleDetails{
    
    switch(type){
      case ThemeType.DARK:
        return _dark.accentColor;
      default:
        return null;
    }
  }

  Color get formConsoleTitle{
    switch(type){
      case ThemeType.DARK:
        return _dark.accentColor;
      case ThemeType.DEFAULT:
        return _defaultTheme.primaryColor;
      default:
        return null;
    }
  }

  Color get iconFavourites{
    
    switch(type){
      case ThemeType.DEFAULT:
        return developerCategorySelectedBorder;
      default:
        return null;
    }
  }

  Color get buttonCreateCPU{
    switch(type){
      case ThemeType.DARK:
        return _defaultTheme.primaryColor;
      case ThemeType.DEFAULT:
        return Colors.white;
      default:
        return null;
    }
  
  }

  ThemeData getTheme() {
    switch(type){
      case ThemeType.DARK:
        return _dark;
      case ThemeType.DEFAULT:
        return _defaultTheme;
      default:
        return null;
    }
  }

  void setTheme(ThemeData theme) {
    switch(type){
      case ThemeType.DARK:
        _dark = theme;
        break;
      case ThemeType.DEFAULT:
        _defaultTheme = theme;
    }
  }


  Color get iconAppBarColor{
    return Colors.white;
  }

  void toggleTheme() {
    switch(type){
      case ThemeType.DARK:
        type = ThemeType.DEFAULT;
        break;
      case ThemeType.DEFAULT:
        type = ThemeType.DARK;
    }
    notifyListeners();
  }

}