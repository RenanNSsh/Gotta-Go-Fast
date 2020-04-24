import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
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
        color: Colors.white,
        size: 24.0,
      ),
      color: Colors.orange,
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
        size: 24.0,
        color: Colors.white,
      ),
      color: Theme.of(context).accentColor,
      onPressed: (){
        Navigator.pushReplacementNamed(
          context,
          "/cpu_add",
        );
      },
    );
  }

}