import 'package:flutter/material.dart';
import 'package:gotta_go_fast/components/categories.dart';
import 'package:gotta_go_fast/components/bottom_bar.dart';
import 'package:gotta_go_fast/components/console_grid.dart';
import 'package:gotta_go_fast/components/search.dart';
import 'package:gotta_go_fast/components/title_text.dart';
import 'package:gotta_go_fast/models/console_model.dart';
import 'package:gotta_go_fast/models/developer_model.dart';
import 'package:gotta_go_fast/services/console_service.dart';

class CPUList extends StatefulWidget {
  @override
  _CPUListState createState() => _CPUListState();
}

class _CPUListState extends State<CPUList> {
  final ConsoleService service = ConsoleService();
  List<ConsoleModel> consoles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _findConsoles();
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
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: BottomBar(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 4.0,
        backgroundColor: Color.fromRGBO(52, 66, 86, 1.0),
        child: Icon(
          Icons.home,
          color:  Color(0xfff7f7f7),
        ),
        onPressed: (){
        },
      ),
      // backgroundColor: Color(0XFF0e0e0e),
      body: buildSafeArea(context),
    );
  }

  Widget buildSafeArea(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xfffbfbfb),
          Color(0xfff7f7f7),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
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
                                CategoriesDevelopers(onTap: findByDeveloper),
                                _consoleGridWidget(),
                                SizedBox(height: 30,)
                              ],
                            ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xfffbfbfb),
      elevation: 0,
      
      title: TitleText(
        text: "Processadores de Consoles",
        fontWeight: FontWeight.w700,
        fontSize: 20,
        maxLines: 1,
      ),
      actions: <Widget>[
        PopupMenuButton(
          icon: Icon(
            Icons.settings,
            color: Colors.black,
          ),
          itemBuilder: (context) => <PopupMenuEntry>[
            // const PopupMenuItem(child: Text("Tema")),
            // const PopupMenuItem(child: Text("Linguagens")),
          ],
          onSelected: (option) {},
        )
      ],
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
        ? ConsoleGrid(consoles: consoles)
        : Center(child: CircularProgressIndicator());
  }
  
}
