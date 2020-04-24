import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotta_go_fast/components/title_text.dart';
import 'package:gotta_go_fast/services/console_service.dart';
import 'package:gotta_go_fast/themes/app_themes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateConsole extends StatefulWidget {

  final Function(bool valid) onValidStateChange;
  final String icon;
  final Function(String icon) onIconChange;
  final Function(String imagePath) onImageChange;
  final TextEditingController consoleNameController;

  CreateConsole({
    Key key,
    @required this.onValidStateChange, 
    @required this.consoleNameController, 
    @required this.onIconChange, 
    this.onImageChange,
    this.icon, 
  }) : super(key: key);

  @override
  _CreateConsoleState createState() => _CreateConsoleState();
}

class _CreateConsoleState extends State<CreateConsole> with SingleTickerProviderStateMixin{
  String iconConsole;
  String imageUrl;

  AnimationController animationConsoleController;
  ConsoleService service = ConsoleService();

  List<String> consoleIcons = [];
  
  bool animationConsoleBoxCompleted = false;
  bool expandConsoleIcons = false;
  bool _isValid = false;
  

  set isValid(bool valid){
    setState(() {
      _isValid = valid;
    });
    widget.onValidStateChange(valid);
  }

  get isValid{
    return _isValid;
  }

  @override
  void initState() { 
    super.initState();
    setConsoleAnimationController();
    getConsoleIcons();
    widget.onIconChange(iconConsole);
  }

  
  getConsoleIcons() async{
    iconConsole = widget.icon != null ? widget.icon : "https://image.flaticon.com/icons/svg/705/705977.svg";
    var icons = await service.findAllConsoleIcons();
    setState(() {
      consoleIcons = icons;
    });
  }
  
  setConsoleAnimationController(){
    animationConsoleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500)
    );
    animationConsoleController.addStatusListener((AnimationStatus status) { 
      if (status == AnimationStatus.completed){
        setState(() {
          animationConsoleBoxCompleted = expandConsoleIcons;
        });
      }

    });
  }

  bool valueExists(String value){
    return value != null && value.isNotEmpty;
  }
  
  bool validate(){
    bool haveConsoleName = valueExists(widget.consoleNameController.text);
    bool haveIcon = valueExists(iconConsole);
    return haveConsoleName && haveIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: TitleText(
              text: "Console",
              fontSize: 24,
              color: Provider.of<AppThemes>(context).appBarTitleColor
            )),
        TextField(
          decoration: InputDecoration(labelText: "Nome",labelStyle: TextStyle(color: Provider.of<AppThemes>(context).appBarTitleColor.withAlpha(200))),
          controller: widget.consoleNameController,
          onChanged: (value) => isValid = validate(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Text(
                  "Icone: ",
                  style: TextStyle(fontSize: 16, color: Provider.of<AppThemes>(context).appBarTitleColor.withAlpha(200)),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    expandConsoleIcons = !expandConsoleIcons;
                  });
                  animationConsoleController.forward(from: 0.0).orCancel;
                },
                child: SvgPicture.network(
                  iconConsole,
                  placeholderBuilder: (context) => Container(
                    child: CircularProgressIndicator(),
                    width: 40,
                    height: 40,
                  ),
                  height: 40,
                ),
              ),
            ],
          ),
        ),
        animationConsoleBoxCompleted
            ? FadeTransition(
                opacity: Tween(
                        begin: expandConsoleIcons ? 0.0 : 1.0,
                        end: expandConsoleIcons ? 1.0 : 0.0)
                    .animate(animationConsoleController),
                child: Material(
                  elevation: 15,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        
                        color: Provider.of<AppThemes>(context).gradientStartColor,
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Provider.of<AppThemes>(context).cardShadow,
                              blurRadius: 50,
                              spreadRadius: 10),
                        ]),
                      child: Column(
                        children: [
                          Wrap(
                              children: consoleIcons
                                  .map((String icon) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                                expandConsoleIcons = false;


                                              iconConsole = icon;
                                              widget.onIconChange(icon);

                                              animationConsoleController
                                                  .forward(from: 0.0)
                                                  .orCancel;
                                            });
                                          },
                                          child: SvgPicture.network(
                                            icon,
                                            placeholderBuilder: (context) =>
                                                Container(
                                              child:
                                                  CircularProgressIndicator(),
                                              width: 40,
                                              height: 40,
                                            ),
                                            height: 40,
                                          ),
                                        ),
                                      ))
                                  .toList())
                        ],
                      )),
                ),
              )
            : Container(),
           
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Text(
                  "Jogo: ",
                  style: TextStyle(fontSize: 16, color: Provider.of<AppThemes>(context).appBarTitleColor.withAlpha(200)),
                ),
              ),
              InkWell(
                onTap: () {
                   ImagePicker.pickImage(source: ImageSource.gallery).then((file){
                    if(file == null) return;
                    setState(() {
                      imageUrl = file.path;
                    });
                    if(widget.onImageChange != null){
                      widget.onImageChange(imageUrl);
                    }
                  });
                },
                child: SvgPicture.network(
                  "https://image.flaticon.com/icons/svg/1752/1752470.svg",
                  placeholderBuilder: (context) => Container(
                    child: CircularProgressIndicator(),
                    width: 40,
                    height: 40,
                  ),
                  height: 40,
                ),
              ),
                imageUrl != null ?Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: InkWell(
                  onTap: () {
                    setState(() {
                      imageUrl = null;
                    });
                  },
                  child: SvgPicture.network(
                    "https://image.flaticon.com/icons/svg/747/747539.svg",
                    placeholderBuilder: (context) => Container(
                      child: CircularProgressIndicator(),
                      width: 30,
                      height: 30,
                    ),
                    height: 30,
                  ),
              ),
                ): Container(),
            ],
          ),
        ),
          imageUrl != null ?  Row(
            children: <Widget>[
              Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(File(imageUrl))
                    )
                  ),
        ),
            ],
          ): Container(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text("*Pressione nos icones para alterar",
        
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, color: Provider.of<AppThemes>(context).appBarTitleColor.withAlpha(200))),
          ),
         
      ],
    );
  }
}
