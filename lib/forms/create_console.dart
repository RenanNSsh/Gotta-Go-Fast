import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotta_go_fast/components/title_text.dart';
import 'package:gotta_go_fast/services/console_service.dart';

class CreateConsole extends StatefulWidget {

  final Function(bool valid) onValidStateChange;
  final String icon;
  final Function(String icon) onIconChange;
  final TextEditingController consoleNameController;

  CreateConsole({
    Key key,
    @required this.onValidStateChange, 
    @required this.consoleNameController, 
    @required this.onIconChange, 
    this.icon
  }) : super(key: key);

  @override
  _CreateConsoleState createState() => _CreateConsoleState();
}

class _CreateConsoleState extends State<CreateConsole> with SingleTickerProviderStateMixin{
  String iconConsole;

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
        )),
        TextField(
          decoration: InputDecoration(labelText: "Nome"),
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
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
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
                      decoration: BoxDecoration(boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Color(0xfff8f8f8),
                            blurRadius: 180,
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
                                              if (iconConsole == icon)
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
        Text("*Pressione no icone para alterar",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 16, color: Colors.grey[700])),
      ],
    );
  }
}
