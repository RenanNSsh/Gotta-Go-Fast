import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotta_go_fast/models/console_model.dart';
import 'package:gotta_go_fast/repository/console_repository.dart';

class CPUList extends StatefulWidget {
  @override
  _CPUListState createState() => _CPUListState();
}

class _CPUListState extends State<CPUList> {
  final ConsoleRepository repository = ConsoleRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Processadores de Consoles'),
          ),
          body: FutureBuilder<List<ConsoleModel>>(
            future: repository.findAllConsoles(),
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
        return cardConsole(consoles[index]);
      },
    );
  }

  Card cardConsole(ConsoleModel console) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(64, 75, 96, .9),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(
                  width: 1.0,
                  color: Colors.white24,
                ),
              ),
            ),
            child: SvgPicture.network(
              console.iconUrl,
              placeholderBuilder: (context) => CircularProgressIndicator(),
              height: 50,
              
            ),
          ),
          title: Text(
            console.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  console.cpu.name,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
          onTap: () {

            Navigator.pushNamed(
              context,
              "/cpu_detail",
              arguments: console,
            );

          },
        ),
      ),
    );
  }
}
