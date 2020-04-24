import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotta_go_fast/components/gradient_container.dart';
import 'package:gotta_go_fast/components/title_text.dart';
import 'package:gotta_go_fast/models/console_model.dart';
import 'package:gotta_go_fast/models/cpu_model.dart';
import 'package:gotta_go_fast/themes/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CPUDetailScreen extends StatefulWidget {
  final ConsoleModel consoleModel;

  CPUDetailScreen(this.consoleModel);

  @override
  _CPUDetailScreenState createState() => _CPUDetailScreenState();
}

class _CPUDetailScreenState extends State<CPUDetailScreen> {

  CPUModel model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      model = widget.consoleModel.cpu;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildHeader(context),
            _buildBottom(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDeveloperNameButton(BuildContext context) {
    return FlatButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "/",
              arguments: widget.consoleModel.developer);
        },
        child: Container(
          padding: const EdgeInsets.all(7.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(
            child: Text(
              widget.consoleModel.developer.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width / 100 * 3.8),
            ),
          ),
        ));
  }

  Widget _buildHeaderContent(BuildContext context) {
    return Column(
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
                widget.consoleModel.iconUrl,
                placeholderBuilder: (context) => CircularProgressIndicator(),
                height: 50,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 100 * 5),
            Flexible(
              flex: 4,
              child: AutoSizeText(
                widget.consoleModel.name,
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
              child: _buildDeveloperNameButton(context),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: <Widget>[
        CarouselSlider.builder(
          itemCount: widget.consoleModel.games.length,
          itemBuilder: (context, index) {
            var model = widget.consoleModel;
            return Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: model.gameImg == null ? NetworkImage(model.games.isEmpty
                      ? ""
                      : model.games[index]) : FileImage(File(model.gameImg)),
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) {
                    print(exception);
                  },
                ),
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: widget.consoleModel.games.length > 1,
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
            child: _buildHeaderContent(context),
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
  }

  Widget _buildKnowMoreButton(BuildContext context) {
    return Stack(children: [
      Container(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          width: MediaQuery.of(context).size.width * 0.70,
          child: RaisedButton(
            onPressed: () {
              launch(model.infoUrl);
            },
            color: Color.fromRGBO(58, 66, 86, 1.0),
            child: TitleText(
              text: "Saiba mais!",
              color: Colors.white,
            ),
          )
        ),
      Positioned(
        child: SvgPicture.network(
          "https://image.flaticon.com/icons/svg/2490/2490396.svg",
          placeholderBuilder: (context) => Container(
            child: CircularProgressIndicator(),
            width: 30,
            height: 30,
          ),
          height: 50,
        ),
        top: 5,
        left: 15,
      ),
    ]);
  }

  Widget _buildBottom(BuildContext context){
    return GradientContainer(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            _buildDescription(),
            _buildSpecification(),
            model.infoUrl != null && model.infoUrl.isNotEmpty
                ? _buildKnowMoreButton(context)
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return ExpansionTile(
      title: TitleText(
        text: "Visão geral",
        fontSize: 20,
        color: Provider.of<AppThemes>(context).titleDetails
      ),
      initiallyExpanded: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Text(
            model.description ?? "",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ],
    );
  }

  Widget _buildRowTextValue(String label, String value) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        label,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      Text(
        value ?? "-",
        style: TextStyle(fontSize: 18.0),
      )
    ]);
  }

  Widget _buildSpecification() {
    return ExpansionTile(
      title: TitleText(
        text: "Especificações",
        fontSize: 20,
        color: Provider.of<AppThemes>(context).appBarTitleColor
      ),
      children: [
        _buildRowTextValue('Nome: ', model.name),
        _buildRowTextValue('Clock: ', model.clockRate),
        _buildRowTextValue('Cache: ', model.cacheSize),
        _buildRowTextValue('Núcleos: ',
            model.coreAmout != null ? model.coreAmout.toString() : ''),
        _buildRowTextValue('Flops: ', model.flops),
      ],
    );
  }
}
