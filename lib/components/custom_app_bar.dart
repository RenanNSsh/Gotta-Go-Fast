import 'package:flutter/material.dart';
import 'package:gotta_go_fast/components/title_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const CustomAppBar({Key key, @required this.title}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    
    return AppBar(
      backgroundColor: Color(0xfffbfbfb),
      elevation: 0,
      title: TitleText(
        text: title,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      actions: <Widget>[
        PopupMenuButton(
          icon: Icon(
            Icons.settings,
            color: Colors.black,
          ),
          itemBuilder: (context) => <PopupMenuEntry>[
            // const PopupMenuItem(child: Text("Tema")),
            // const PopupMenuItem(child: Text("Linguagens")),
          ],
          onSelected: (option) {},
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}