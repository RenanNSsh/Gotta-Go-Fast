import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotta_go_fast/components/title_text.dart';
import 'package:gotta_go_fast/models/developer_model.dart';

class DeveloperIcon extends StatelessWidget {
  // final String imagePath;
  // final String text;
  // final bool isSelected;
  final  DeveloperModel model;
  final bool isSelected;
  final Function(DeveloperModel model) onCategoryTap;
  DeveloperIcon({Key key,this.model, this.isSelected, this.onCategoryTap})
      : super(key: key);

  Widget build(BuildContext context) {
    return model == null ? Container(width: 5,)
    : InkWell(
      onTap: (){
        onCategoryTap.call(model);
      },
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10,),
        alignment: Alignment.center,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: isSelected ? Color(0XFFFFFFFF) : Colors.transparent,
          border: Border.all(
              color: isSelected ? Color(0xffE65829) : Color(0xffA1A3A6),
              width: isSelected ? 2 : 1),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: isSelected ?  Color(0xfffbf2ef) : Colors.white,
               blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(5,5)
                ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: model.iconUrl != null ? SvgPicture.network(
                  model.iconUrl,
                  placeholderBuilder: (context) => Container(child:CircularProgressIndicator(), width: 30, height: 30,),
                  height: 30,
                  
                ) : SizedBox(),
            ),
            model.name == null ? Container()
            : Container(
              child: TitleText(
                text: model.name,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
