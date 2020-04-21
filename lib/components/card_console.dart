import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotta_go_fast/models/console_model.dart';

class CardConsole extends StatelessWidget {

  final ConsoleModel console;

  CardConsole(this.console);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: new EdgeInsets.symmetric(
        vertical:8.0,
        horizontal: 12.0,
      ),
      decoration: BoxDecoration(
        color: const Color(0XFF181818),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [BoxShadow(offset: Offset.fromDirection(2))]
      ),
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            "/cpu_detail",
            arguments: console,
          );
        },
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 12.0,
        child: _buildListTile(),
      ),
      
    );
  }

  ListTile _buildListTile() {
    return ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(
                  width: 1.0,
                  color: Colors.white24,
                ),
              ),
            ),
            child: SvgPicture.network(
              console.iconUrl,
              placeholderBuilder: (context) => CircularProgressIndicator(),
              height: 50,
              
            ),
          ),
          title: Text(
            console.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  console.cpu.name,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
        );
  }
}