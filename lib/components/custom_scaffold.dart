import 'package:flutter/material.dart';
import 'package:gotta_go_fast/components/title_text.dart';
import 'package:gotta_go_fast/models/menu_item.dart';
import 'package:gotta_go_fast/themes/app_themes.dart';
import 'package:gotta_go_fast/themes/theme_type.dart';
import 'package:provider/provider.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  AppThemes themeHelper;
  CustomScaffold({Key key, @required this.title, @required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   themeHelper = Provider.of<AppThemes>(context);
    return Scaffold(
      appBar: _buildAppBar(context),
      bottomNavigationBar: _buildBottomAppBar(context),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(context),
      // backgroundColor: Color(0XFF0e0e0e),
      body: body,
    );
  }

  AppBar _buildAppBar(BuildContext context){
    return AppBar(
      backgroundColor: Provider.of<AppThemes>(context).gradientStartColor,
      elevation: 0,
      title: TitleText(
        text: title,
        color: Provider.of<AppThemes>(context).appBarTitleColor,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      actions: <Widget>[
        PopupMenuButton(
          icon: Icon(
            Icons.settings,
            color: Provider.of<AppThemes>(context).appBarTitleColor,
          ),
          itemBuilder: (context) => <PopupMenuEntry<MenuItem>>[
            PopupMenuItem<MenuItem>(child: Text(Provider.of<AppThemes>(context).isInDarkMode ? "Tema claro" : "Tema Escuro"),value: MenuItem.THEME,),
            PopupMenuItem<MenuItem>(child: Text("English"),value: MenuItem.LANGUAGE),
          ],
          onSelected: (MenuItem option) {
            switch(option){
              case MenuItem.THEME:
                Provider.of<AppThemes>(context).toggleTheme();
            }
          },
        )
      ],
    );
  }

  Widget _buildFloatingActionButton(BuildContext context){
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
        tooltip: 'Processadores',
        child: Icon(
          Icons.home,
          color: themeHelper.iconAppBarColor,
        ),
        elevation: 2.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  BottomAppBar _buildBottomAppBar(BuildContext context){
     return BottomAppBar(
      notchMargin: 4.0,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width:7),
          _buildAdd(context),
          _buildHome(context),  
          _buildFavourites(context),
          SizedBox(width:7),
        ],
      ),
      color: Theme.of(context).primaryColor,
      shape: CircularNotchedRectangle(),
    );
  }

  
  _buildHome(BuildContext context){
    return IconButton(
      icon: Icon(
        Icons.home,
        size: 24.0,
      ),
      color: Colors.transparent,
      onPressed: (){
        print('pressed');
          Navigator.pushReplacementNamed(
            context,
            "/",
          );
      },
    );
  }

  _buildFavourites(BuildContext context){
    return IconButton(
      icon:Icon(
        Icons.star,
        color: themeHelper.iconAppBarColor,
        size: 24.0,
      ),
      onPressed: (){
          Navigator.pushReplacementNamed(
            context,
            "/favourites",
          );
      },
    );
  }

  _buildAdd(BuildContext context){
    return IconButton(
      icon: Icon(
        Icons.add,
        size: 30.0,
        color: themeHelper.iconAppBarColor,
      ),
      onPressed: (){
        Navigator.pushReplacementNamed(
          context,
          "/cpu_add",
        );
      },
    );
  }
}