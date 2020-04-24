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

  bool get isLoading {
    return _isLoading;
  }

  set isLoading(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  List<DeveloperModel> get myDevelopers {
    return _myDevelopers;
  }

  set myDevelopers(List<DeveloperModel> developers) {
    setState(() {
      _myDevelopers = developers;
    });
  }

  List<ConsoleModel> get consoles {
    return _consoles;
  }

  set consoles(List<ConsoleModel> consoles) {
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
    myDevelopers = developers;
    consoles = consoleList;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Processadores Favoritos',
      body: GradientContainer(
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
                      Search(onChanges: _filterConsoles),
                      CategoriesDevelopers(
                          onTap: findByDeveloper,
                          developers: myDevelopers),
                      _consoleGridWidget(),
                      isLoading
                          ? Center(child: CircularProgressIndicator())
                          : Container(),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  )
                )
              )
            ],
          ),
        ),
      )
    );
  }

  Future<void> _filterConsoles(String text) async {
    isLoading = true;
    var filtredConsoles = await service.filterLikedsByText(text);
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
        ? ConsoleGrid(consoles: consoles, onChangeFavourite: _removeFavourite)
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
                      child: TitleText(text: "Não há nenhum item adicionado.",color: Provider.of<AppThemes>(context).appBarTitleColor,)),
                ],
              ))
            : Container();
  }

  void _removeFavourite() {
    this.isLoading = true;
    _findConsoles();
  }
}
