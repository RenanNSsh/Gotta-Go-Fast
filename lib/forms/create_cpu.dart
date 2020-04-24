import 'package:flutter/material.dart';
import 'package:gotta_go_fast/components/title_text.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // _appBar(),
        Center(
            child: TitleText(
          text: "Processador",
        )),
        TextField(
          decoration: InputDecoration(labelText: "Nome"),
          controller: widget.cpuNameController,
          onChanged: (value) => isValid = validate(),
        ),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(labelText: "Descrição"),
          controller: widget.cpuDescriptionController,
          onChanged: (value) => isValid = validate(),
        ),
        TextField(
          decoration: InputDecoration(labelText: "Clock"),
          controller: widget.cpuClockController,
          onChanged: (value) => isValid = validate(),
        ),
        TextField(
          decoration: InputDecoration(labelText: "Núcleos"),
          controller: widget.cpuCoreController,
          onChanged: (value) => isValid = validate(),
        ),
        TextField(
          decoration: InputDecoration(labelText: "Cache"),
          controller: widget.cpuCacheController,
          onChanged: (value) => isValid = validate(),
        ),
        TextField(
          decoration: InputDecoration(labelText: "Flops"),
          controller: widget.cpuFlopsController,
          onChanged: (value) => isValid = validate(),
        ),

        TextField(
          decoration: InputDecoration(labelText: "Link de Referência"),
          controller: widget.cpuURLInfoController,
          onChanged: (value) => isValid = validate(),
        ),

        // Center(
        //   child: Stack(children: [
        //     Container(
        //         width: MediaQuery.of(context).size.width * 0.70,
        //         child: RaisedButton(
        //           shape: RoundedRectangleBorder(side: BorderSide(color:  Color(0xffE65829))),
        //           onPressed: () {},
        //           color: Colors.white,

        //           child: TitleText(
        //             text: "Criar!",
        //             color: Color(0xffE65829),
        //           ),
        //         )),
        //     Positioned(
        //       child: SvgPicture.network(
        //         "https://image.flaticon.com/icons/svg/2654/2654598.svg",
        //         placeholderBuilder: (context) => Container(
        //           child: CircularProgressIndicator(),
        //           width: 30,
        //           height: 30,
        //         ),
        //         height: 50,
        //       ),
        //       top: 5,
        //       left: 15,
        //     ),
        //   ]),
        // )
      ],
    );
  }
}
