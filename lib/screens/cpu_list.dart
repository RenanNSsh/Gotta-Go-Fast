import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotta_go_fast/components/card_console.dart';
import 'package:gotta_go_fast/models/console_model.dart';
import 'package:gotta_go_fast/repository/console_repository.dart';
import 'package:gotta_go_fast/services/console_service.dart';

class CPUList extends StatefulWidget {
  @override
  _CPUListState createState() => _CPUListState();
}

class _CPUListState extends State<CPUList> {
  final ConsoleService service = ConsoleService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Processadores de Consoles'),
          ),
          body: FutureBuilder<List<ConsoleModel>>(
            future: service.findAll(),
            builder: (context, snapshot) {

              var successfulConection =
                  snapshot.connectionState == ConnectionState.done;
              var hasData = snapshot.hasData;
              var successful = successfulConection && hasData;

              if (successful) {
                return buildListView(snapshot.data);
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }

  Widget buildListView(List<ConsoleModel> consoles) {
    return ListView.builder(
      itemCount: consoles.length,
      itemBuilder: (context, index) {
        return CardConsole(consoles[index]);
      },
    );
  }
  
}
