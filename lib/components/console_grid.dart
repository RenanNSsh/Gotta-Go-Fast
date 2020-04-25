import 'package:flutter/material.dart';
import 'package:gotta_go_fast/components/console_card.dart';
import 'package:gotta_go_fast/models/console_model.dart';

class ConsoleGrid extends StatelessWidget {
  final List<ConsoleModel> consoles;
  final VoidCallback onChangeFavourite;
  final Function(ConsoleModel model) onDeleted;
  ConsoleGrid({@required this.consoles, this.onChangeFavourite, this.onDeleted});

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: GridView.builder(
          itemCount: consoles.length,
          itemBuilder: (context, index) {
            return consoles.length!= 0 ? ConsoleCard(
              onDeleted: onDeleted,
              console: consoles[index],
              onChangeFavourite: onChangeFavourite
            ) : Container();
          },

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 4 / 3,
              mainAxisSpacing: 30,
              crossAxisSpacing: 20),
          padding: EdgeInsets.only(left: 20),
          scrollDirection: Axis.horizontal,
      ),
    );
  }
}