import 'package:flutter/material.dart';
import 'package:gotta_go_fast/components/developer_icon.dart';
import 'package:gotta_go_fast/models/developer_model.dart';
import 'package:gotta_go_fast/services/console_service.dart';

class CategoriesDevelopers extends StatefulWidget {
  final Function(DeveloperModel model) onTap;
  final List<DeveloperModel> developers;
  CategoriesDevelopers({Key key,@required this.onTap, this.developers}) : super(key: key);

  @override
  _CategoriesDevelopersState createState() => _CategoriesDevelopersState(onTap);
}

class _CategoriesDevelopersState extends State<CategoriesDevelopers> {
  Function(DeveloperModel model) onTap;
  ConsoleService consoleService = ConsoleService();
  int indexSelected;
  List<DeveloperModel> developers = [];
  _CategoriesDevelopersState(this.onTap);

  @override
  void didUpdateWidget(CategoriesDevelopers oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if(widget.developers != null){
      setState(() {
        this.developers = widget.developers;
        
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      indexSelected = 0;
    });
    if(widget.developers == null){
      _findDevelopers();

    }
  }
  
  _findDevelopers() async {
    var devs = await consoleService.findDevelopers();
    setState(() {
      developers = devs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: ListView.builder(
            itemCount: developers.length,
            itemBuilder: (context, index) {
              return DeveloperIcon(
                model: developers[index],
                isSelected: index == indexSelected,
                onCategoryTap: (model) {
                  indexSelected = index;
                  widget.onTap(model);
                },
              );
            },
            scrollDirection: Axis.horizontal));
  }
}