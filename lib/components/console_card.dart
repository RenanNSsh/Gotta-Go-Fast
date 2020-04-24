import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotta_go_fast/components/title_text.dart';
import 'package:gotta_go_fast/models/console_model.dart';
import 'package:gotta_go_fast/themes/app_themes.dart';
import 'package:provider/provider.dart';

class ConsoleCard extends StatefulWidget {
  final ConsoleModel console;
  final VoidCallback onChangeFavourite;
  final Function(ConsoleModel model) onDeleted;
  bool isSelected;
  ConsoleCard({Key key, this.console,this.onChangeFavourite, this.isSelected = false, this.onDeleted})
      : super(key: key);

  @override
  _ConsoleCardState createState() => _ConsoleCardState();
}

class _ConsoleCardState extends State<ConsoleCard> {
  ConsoleModel model;

  _ConsoleCardState();

  @override
  void initState() {
    model = widget.console;
    super.initState();
  }

  @override
  void didUpdateWidget(ConsoleCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      model = widget.console;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/cpu_detail",
          arguments: model,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Provider.of<AppThemes>(context).cardColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Provider.of<AppThemes>(context).cardShadow, blurRadius: 15, spreadRadius: 10),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _buildFavouriteIcon(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildConsoleIcon(),
                _buildTitle(),
                _buildSubtitle(),
                _buildExpressiveValue(),
              ],
            ),
            _buildRemoveIcon()
          ],
        ),
      ),
    );
  }

  TitleText _buildExpressiveValue() {
    return TitleText(
      text: model.cpu.name,
      fontSize: 18,
      color: Provider.of<AppThemes>(context).consoleCardTitle,
    );
  }

  TitleText _buildSubtitle() {
    return TitleText(
      text: model.developer.name,
      maxLines: 1,
      fontSize: 14,
      color: Provider.of<AppThemes>(context).consoleCardSubtitle,
    );
  }

  TitleText _buildTitle() {
    return TitleText(
      text: model.name,
      color: Provider.of<AppThemes>(context).consoleCardTitle,
      fontSize: 16,
    );
  }

  Widget _buildFavouriteIcon() {
    return Positioned(
        left: 0,
        top: 0,
        child: IconButton(
          icon: Icon(
            model.isliked ? Icons.star : Icons.star_border,
            color: model.isliked ? Colors.orange : Color(0xffa8a09b),
            size: 35,
          ),
          onPressed: () {
            setState(() {
              model.isliked = !model.isliked;
            });
            if(widget.onChangeFavourite != null){
              widget.onChangeFavourite();
            }
          }
        )
    );
  }

  
  Widget _buildRemoveIcon() {
    return Positioned(
        right: 0,
        top: 0,
        child: IconButton(
          icon: Icon(
            Icons.delete_forever,
            color: Color(0xffa8a09b),
            size: 35,
          ),
          onPressed: () {
            if(widget.onDeleted != null){
              widget.onDeleted(model);
            }
          }
        )
    );
  }

  Widget _buildConsoleIcon() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 45,
          backgroundColor: Color(0xffE65829).withAlpha(40),
        ),
        SvgPicture.network(
          model.iconUrl,
          placeholderBuilder: (context) => CircularProgressIndicator(),
          height: 90,
        ),
      ],
    );
  }
}
