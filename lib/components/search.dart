import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final Function(String text) onChanges;
  Search({Key key, @required this.onChanges}) : super(key: key);

  @override
  _SearchState createState() => _SearchState(onChanges);
}

class _SearchState extends State<Search> {
  Function(String text) onChanges;

  _SearchState(this.onChanges);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xffE1E2E4).withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                onChanged: (value) {
                  onChanges(value);
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Pesquisar...",
                    hintStyle: TextStyle(fontSize: 14),
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: Colors.black54)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}