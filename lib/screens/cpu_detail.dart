import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
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

    final developerName = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
        border: new Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: new Text(
          consoleModel.developer.name,
          style: TextStyle(color: Colors.white,fontSize:  MediaQuery.of(context).size.width /100 * 3.8),
          
        ),
      ),
    );

    final topContentText = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 30.0),
        
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(width: 30.0),
              Flexible(
                flex: 1,
                                child: SvgPicture.network(
                consoleModel.iconUrl,
                placeholderBuilder: (context) => CircularProgressIndicator(),
                height: 50,
                
              ),
            ),
              
            SizedBox(width: MediaQuery.of(context).size.width /100 * 5),
            Flexible(
              flex: 4,
                          child: AutoSizeText(
                consoleModel.name,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize:  MediaQuery.of(context).size.width *7 / 100,
                ),
              ),
            ),
          ],
        ),
       
        Container(
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: MediaQuery.of(context).size.width /100 ),
        AutoSizeText(
          model.name,
          maxLines: 1,
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width /100 * 9,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.width /100 *2.7),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: developerName,
            ),
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
          CarouselSlider.builder(

              itemCount: consoleModel.games.length,
              itemBuilder: (context, index) {
                return Container(
                  
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: NetworkImage(consoleModel.games.isEmpty ? "" : consoleModel.games[index]),
                      fit: BoxFit.cover,
                      onError: (exception, stackTrace) {
                        print(exception);
                      },
                    ),
                  ),
                            
                );
              },
              options: CarouselOptions( 
                autoPlay: consoleModel.games.length > 1,
                viewportFraction: 1.0,
                height: MediaQuery.of(context).size.height * 0.5,
                enlargeCenterPage: true,),
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

    final knowMoreButton = Container(
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
            // knowMoreButton,
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