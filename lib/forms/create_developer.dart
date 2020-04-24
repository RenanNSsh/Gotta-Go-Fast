import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotta_go_fast/components/title_text.dart';
import 'package:gotta_go_fast/services/console_service.dart';

class CreateDeveloper extends StatefulWidget {
  
  final String icon;
  final Function(bool valid) onValidStateChange;
  final Function(String icon) onIconChange;
  final TextEditingController developerNameController;

  CreateDeveloper({
    Key key, 
    @required this.onValidStateChange, 
    @required this.developerNameController, 
    @required this.onIconChange, 
    this.icon
  }) : super(key: key);

  @override
  _CreateDeveloperState createState() => _CreateDeveloperState();
}

class _CreateDeveloperState extends State<CreateDeveloper> with SingleTickerProviderStateMixin{
  
  ConsoleService service = ConsoleService();

  String developerIcon;
  
  AnimationController animationDeveloperController;

  bool expandDevelopersIcons = false;
  bool animationDeveloperBoxCompleted = false;
  bool _isValid = false;

  List<String> developerIcons = [];

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
    setDeveloperAnimationController();
    getDeveloperIcons();
    widget.onIconChange(developerIcon);
  }

  
  getDeveloperIcons() async{
    developerIcon = widget.icon != null ? widget.icon : "https://image.flaticon.com/icons/svg/2634/2634463.svg";
    var icons = await service.findAllDeveloperIcons();
    setState(() {
      developerIcons = icons;
    });
  }

  bool valueExists(String value){
    return value != null && value.isNotEmpty;
  }
  
  bool validate(){
      bool haveDeveloperName = valueExists(widget.developerNameController.text);
      bool haveIcon = valueExists(developerIcon);
      return haveDeveloperName && haveIcon;
  }


  setDeveloperAnimationController(){
      animationDeveloperController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500)
      );
      animationDeveloperController.addStatusListener((AnimationStatus status) { 
        if (status == AnimationStatus.completed){
          setState(() {
            animationDeveloperBoxCompleted = expandDevelopersIcons;
          });
        }

      });
    }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Center(
              child: TitleText(text: "Desenvolvedora",)
            ),  
            TextField(
              decoration: InputDecoration(labelText: "Desenvolvedora"),
              controller: widget.developerNameController,
              onChanged: (value) => isValid = validate(),
            ),
           Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                
                children: <Widget>[
                  
                  Flexible(
                    child: Text( "Icone: ", style: TextStyle(fontSize: 16, color: Colors.grey[700]),),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        expandDevelopersIcons = !expandDevelopersIcons;
                      });
                      animationDeveloperController.forward();
                    },
                                      child: SvgPicture.network(
                        developerIcon,
                        placeholderBuilder: (context) => Container(
                          child: CircularProgressIndicator(),
                          width: 20,
                          height: 20,
                        ),
                        height: 40,
                      ),
                  )
                ],
              ),
            ), 
              expandDevelopersIcons? FadeTransition(

               opacity: Tween(begin: expandDevelopersIcons? 0.0 : 1.0, end: expandDevelopersIcons? 1.0 : 0.0).animate(animationDeveloperController),
              child: Material(
                
                elevation: 15,
              
                            child: Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xfff8f8f8), blurRadius: 180, spreadRadius: 10),
          ]
                  ),
                  child:  Column(
                children: [Wrap(
                  children: 
                    developerIcons.map((String icon) => 
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              if(developerIcon == icon)  expandDevelopersIcons = false;

                              developerIcon = icon;
                              widget.onIconChange(icon);
                              animationDeveloperController.forward();
                            });
                          },
                                                  child: SvgPicture.network(
                              icon,
                              placeholderBuilder: (context) => Container(
                                child: CircularProgressIndicator(),
                                width: 40,
                                height: 40,
                              ),
                              height: 40,
                            ),
                        ),
                      )).toList()
                  
                )],
              )
            )
              )
              ): Container(),
            Text( "*Pressione nos icones para alterar",textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
       
          ],
        );
  }
}