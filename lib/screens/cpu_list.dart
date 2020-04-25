import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotta_go_fast/components/categories_developers.dart';
import 'package:gotta_go_fast/components/console_grid.dart';
import 'package:gotta_go_fast/components/custom_scaffold.dart';
import 'package:gotta_go_fast/components/gradient_container.dart';
import 'package:gotta_go_fast/components/search.dart';
import 'package:gotta_go_fast/components/title_text.dart';
import 'package:gotta_go_fast/models/console_model.dart';
import 'package:gotta_go_fast/models/developer_model.dart';
import 'package:gotta_go_fast/services/console_service.dart';
import 'package:gotta_go_fast/themes/app_themes.dart';
import 'package:provider/provider.dart';

class CPUList extends StatefulWidget {
  final DeveloperModel initialDeveloper;

  CPUList(this.initialDeveloper);

  @override
  _CPUListState createState() => _CPUListState(initialDeveloper);
}

class _CPUListState extends State<CPUList> {

  
  final ConsoleService service = ConsoleService();
  DeveloperModel initialDeveloper;
  List<ConsoleModel> consoles = [];
  bool isLoading = true;

  _CPUListState(this.initialDeveloper);

  @override
  void initState() {
    super.initState();
    updateConsoles();
  }

  updateConsoles(){
     if (initialDeveloper == null) {
      _findConsoles();
    } else {
      findByDeveloper(initialDeveloper);
      isLoading = false;
    }
  }

  _findConsoles() async {
    var consoleList = await service.findAll();
    setState(() {
      consoles = consoleList;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Processadores de Consoles',
      body: GradientContainer(
      child: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // _appBar(),
                    AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        switchInCurve: Curves.easeInToLinear,
                        switchOutCurve: Curves.easeOutBack,
                        child: Column(
                          children: <Widget>[
                            Search(onChanges: _filterConsoles),
                            CategoriesDevelopers(
                              onTap: findByDeveloper,
                              initialDeveloper: initialDeveloper,
                            ),
                            _consoleGridWidget(),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
    );
  }

  Future<void> _filterConsoles(String text) async {
    setState(() {
      isLoading = true;
    });
    var filtredConsoles = await service.filterByText(text);
    setState(() {
      consoles = filtredConsoles;
      isLoading = false;
    });
  }

  Future<void> findByDeveloper(DeveloperModel model) async {
    setState(() {
      isLoading = true;
    });
    var consolesByDev = await service.filterByDeveloper(model);
    setState(() {
      consoles = consolesByDev;
      isLoading = false;
    });
  }

  Widget _consoleGridWidget() {
    return !isLoading && consoles.length != 0
        ? ConsoleGrid(consoles: consoles,onDeleted: (ConsoleModel console) {
            service.delete(console);
            updateConsoles();
        },)
        : !isLoading
            ? Container(
                child: Column(
                  
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  SvgPicture.network(
                    "https://image.flaticon.com/icons/svg/872/872605.svg",
                    color: Provider.of<AppThemes>(context).iconFavourites,
                    placeholderBuilder: (context) =>
                        Container(
                      child:
                          CircularProgressIndicator(),
                      width: 80,
                      height: 80,
                    ),
                    height: 80,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                      child: TitleText(text: "Não foi encontrado nenhum item",color: Provider.of<AppThemes>(context).appBarTitleColor,)),
                ],
              ))
            : Container();
  }
}
