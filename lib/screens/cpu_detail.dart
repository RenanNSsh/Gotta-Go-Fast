import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotta_go_fast/components/title_text.dart';
import 'package:gotta_go_fast/models/console_model.dart';
import 'package:gotta_go_fast/models/cpu_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CPUDetailScreen extends StatelessWidget {
  CPUModel model;
  ConsoleModel consoleModel;

  CPUDetailScreen(this.consoleModel);

  @override
  Widget build(BuildContext context) {
    model = consoleModel.cpu;

    final developerName = FlatButton(
      onPressed: (){
        Navigator.pushReplacementNamed(
            context,
            "/",
            arguments: consoleModel.developer
          );
      },
      child: Container(
        padding: const EdgeInsets.all(7.0),
        decoration:  BoxDecoration(
          border:  Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
          child:  Text(
            consoleModel.developer.name,
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width / 100 * 3.8),
          ),
        ),
      )

    ) ;
   

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
            SizedBox(width: MediaQuery.of(context).size.width / 100 * 5),
            Flexible(
              flex: 4,
              child: AutoSizeText(
                consoleModel.name,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 7 / 100,
                ),
              ),
            ),
          ],
        ),
        Container(
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: MediaQuery.of(context).size.width / 100),
        AutoSizeText(
          model.name,
          maxLines: 1,
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width / 100 * 9,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.width / 100 * 2.7),
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
                  image: NetworkImage(consoleModel.games.isEmpty
                      ? ""
                      : consoleModel.games[index]),
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
            enlargeCenterPage: true,
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

    final knowMoreButton =  Stack(
          children: [
           Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      width: MediaQuery.of(context).size.width * 0.70,
      child: RaisedButton(
        onPressed: (){
          launch(model.infoUrl);
        },
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child:
            TitleText(
              text:"Saiba mais!",
              color: Colors.white,
            ),
        )
        
        
      ), Positioned(child: SvgPicture.network(
                "https://image.flaticon.com/icons/svg/2490/2490396.svg",
                placeholderBuilder: (context) => Container(child:CircularProgressIndicator(), width: 30, height: 30,),
                height: 50,
                ),top: 5,left: 15,
            
              ),
          ]
    );

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            ExpansionTile(
              title: TitleText(
                text: "Visão geral",
                fontSize: 20,
              ),
              initiallyExpanded: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: bottomContentText,
                ),
              ],
            ),
            ExpansionTile(
              title: TitleText(
                text: "Especificações",
                fontSize: 20,
              ),
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nome: ',
                        style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        model.name ?? "-",
                        style: TextStyle(fontSize: 18.0),
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Clock: ',
                        style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        model.clockRate ?? "-",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cache: ',
                        style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        model.cacheSize ?? "-",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Núcleos: ',
                        style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        model.coreAmout != null ? model.coreAmout.toString() : "-",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Flops: ',
                        style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        model.flops ?? "-",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ]),
              ],
            ),
            model.infoUrl != null && model.infoUrl.isNotEmpty ? knowMoreButton : Container(),
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
