import 'package:flutter/material.dart';
import 'package:gotta_go_fast/components/bottom_bar.dart';
import 'package:gotta_go_fast/components/categories.dart';
import 'package:gotta_go_fast/components/console_grid.dart';
import 'package:gotta_go_fast/components/custom_floating_action_button.dart';
import 'package:gotta_go_fast/components/search.dart';
import 'package:gotta_go_fast/components/title_text.dart';
import 'package:gotta_go_fast/models/console_model.dart';
import 'package:gotta_go_fast/models/developer_model.dart';
import 'package:gotta_go_fast/services/console_service.dart';

class Favourites extends StatefulWidget {
  Favourites({Key key}) : super(key: key);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  
  final ConsoleService service = ConsoleService();
  List<ConsoleModel> _consoles = [];
  List<DeveloperModel> _myDevelopers = [];
  bool _isLoading = true;

  bool get isLoading{
    return _isLoading;
  }

  set isLoading(bool isLoading){
    setState(() {
      _isLoading = isLoading;
    });
  }

  List<DeveloperModel> get myDevelopers{
    return _myDevelopers;
  }

  set myDevelopers(List<DeveloperModel> developers){
    setState(() {
      _myDevelopers = developers;
    });
  }

  List<ConsoleModel> get consoles{
    return _consoles;
  }

  set consoles(List<ConsoleModel> consoles){
    setState(() {
      _consoles = consoles;
    });
  }

  
  
  @override
  void initState() {
    super.initState();
    _findConsoles();
  }

  _findConsoles() async {
    var developers = await service.findMyDevelopers();
    var consoleList = await service.findLikeds();
    isLoading = false;
    myDevelopers =  developers;
    consoles = consoleList;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: BottomBar(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActionButton(),
      // backgroundColor: Color(0XFF0e0e0e),
      body: buildSafeArea(context),
    );
  }

  
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xfffbfbfb),
      elevation: 0,
      title: TitleText(
        text: "Processadores Favoritos",
        fontWeight: FontWeight.w700,
        fontSize: 20,
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
                                CategoriesDevelopers(onTap: findByDeveloper, developers: myDevelopers),
                                _consoleGridWidget(),
                                isLoading? Center(child: CircularProgressIndicator()) : Container(),
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

  
  Future<void> _filterConsoles(String text) async {
    isLoading = true;
    var filtredConsoles = await service.filterByText(text);
    consoles = filtredConsoles;
    isLoading = false;
    
  }

  Future<void> findByDeveloper(DeveloperModel model) async {
    isLoading = true;
    var consolesByDev = await service.filterLikedsByDeveloper(model);
    consoles = consolesByDev;
    isLoading = false;
  }

  
  Widget _consoleGridWidget() {
    return !isLoading && consoles.length != 0
        ? ConsoleGrid(consoles: consoles, onChangeFavourite:_removeFavourite)
        : !isLoading ? Container(
          child: 
          Column(
            children: <Widget>[
              SizedBox(height: 70,),
              Icon(Icons.sentiment_dissatisfied,size: 90,color: Colors.grey,),
              Center(child: TitleText(text: "Não há nenhum item adicionado.")),
            ],
          )

        ) : Container();
  }

  void _removeFavourite(){
    this.isLoading = true;
    _findConsoles();
  }
  

}