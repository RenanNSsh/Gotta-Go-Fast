import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotta_go_fast/models/console_model.dart';
import 'package:gotta_go_fast/models/cpu_model.dart';

class CPUDetailScreen extends StatelessWidget {
  CPUModel model;

  @override
  Widget build(BuildContext context) {
    ConsoleModel consoleModel = ModalRoute.of(context).settings.arguments;
    model = consoleModel.cpu;

    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
        border: new Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: new Text(
          consoleModel.developer,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 80.0),
        Row(
          children: <Widget>[
        SizedBox(width: 30.0),
             SvgPicture.network(
            consoleModel.iconUrl,
            placeholderBuilder: (context) => CircularProgressIndicator(),
            height: 50,
            
          ),
          
        SizedBox(width: 50.0),
        Text(
          consoleModel.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
          ],
        ),
       
        Container(
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          model.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
        SizedBox(height: 22.7),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: coursePrice,
            ),
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: NetworkImage("https://s2.glbimg.com/gQ90wGlaGxRYProvuUNdnbJlPBI=/0x0:695x391/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2017/K/g/f3EkjfR5WVFdsGQu0vXQ/crash6.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      model.description ?? "",
      style: TextStyle(fontSize: 18.0),
    );

    final readButton = Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: () => {},
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Text(
          "Saiba mais!",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            bottomContentText,
            // readButton,
          ],
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            topContent,
            bottomContent,
          ],
        ),
      ),
    );
  }
}