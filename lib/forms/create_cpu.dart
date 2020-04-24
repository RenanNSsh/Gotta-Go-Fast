import 'package:flutter/material.dart';
import 'package:gotta_go_fast/components/title_text.dart';
import 'package:gotta_go_fast/themes/app_themes.dart';
import 'package:provider/provider.dart';

class CreateCPU extends StatefulWidget {
  
  final TextEditingController cpuNameController;
  final TextEditingController cpuDescriptionController;
  final TextEditingController cpuClockController;
  final TextEditingController cpuCoreController;
  final TextEditingController cpuCacheController;
  final TextEditingController cpuFlopsController;
  final TextEditingController cpuURLInfoController;
  final Function(bool valid) onValidStateChange;
  CreateCPU({
    Key key, 
    @required this.onValidStateChange, 
    @required this.cpuNameController, 
    @required this.cpuDescriptionController, 
    @required this.cpuClockController, 
    @required this.cpuCoreController, 
    @required this.cpuCacheController, 
    @required this.cpuFlopsController, 
    @required this.cpuURLInfoController}) : super(key: key);

  @override
  _CreateCPUState createState() => _CreateCPUState();
}

class _CreateCPUState extends State<CreateCPU> {
  bool _isValid = false;

  set isValid(bool valid) {
    setState(() {
      _isValid = valid;
    });
    widget.onValidStateChange(valid);
  }

  get isValid {
    return _isValid;
  }

  bool validate() {
    bool haveName = valueExists(widget.cpuNameController.text);
    bool haveDescription = valueExists(widget.cpuDescriptionController.text);
    return haveName && haveDescription;
  }

  bool valueExists(String value) {
    return value != null && value.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    Color greyField = Provider.of<AppThemes>(context).appBarTitleColor.withAlpha(200);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // _appBar(),
        Center(
            child: TitleText(
          text: "Processador",
              fontSize: 24,
              color: Provider.of<AppThemes>(context).appBarTitleColor
        )),
        TextField(
          decoration: InputDecoration(labelText: "Nome", labelStyle: TextStyle(color: greyField)),
          controller: widget.cpuNameController,
          onChanged: (value) => isValid = validate(),
        ),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(labelText: "Descrição", labelStyle: TextStyle(color: greyField)),
          controller: widget.cpuDescriptionController,
          onChanged: (value) => isValid = validate(),
        ),
        TextField(
          decoration: InputDecoration(labelText: "Clock", labelStyle: TextStyle(color: greyField)),
          controller: widget.cpuClockController,
          onChanged: (value) => isValid = validate(),
        ),
        TextField(
          decoration: InputDecoration(labelText: "Núcleos", labelStyle: TextStyle(color: greyField)),
          controller: widget.cpuCoreController,
          onChanged: (value) => isValid = validate(),
        ),
        TextField(
          decoration: InputDecoration(labelText: "Cache", labelStyle: TextStyle(color: greyField)),
          controller: widget.cpuCacheController,
          onChanged: (value) => isValid = validate(),
        ),
        TextField(
          decoration: InputDecoration(labelText: "Flops", labelStyle: TextStyle(color: greyField)),
          controller: widget.cpuFlopsController,
          onChanged: (value) => isValid = validate(),
        ),

        TextField(
          decoration: InputDecoration(labelText: "Link de Referência", labelStyle: TextStyle(color: greyField)),
          controller: widget.cpuURLInfoController,
          onChanged: (value) => isValid = validate(),
        ),

      ],
    );
  }
}
