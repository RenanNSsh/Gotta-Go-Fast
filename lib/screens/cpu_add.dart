// flutter
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// project
import 'package:gotta_go_fast/components/custom_scaffold.dart';
import 'package:gotta_go_fast/components/gradient_container.dart';
import 'package:gotta_go_fast/components/title_text.dart';
import 'package:gotta_go_fast/forms/create_console.dart';
import 'package:gotta_go_fast/forms/create_cpu.dart';
import 'package:gotta_go_fast/forms/create_developer.dart';
import 'package:gotta_go_fast/models/console_model.dart';
import 'package:gotta_go_fast/models/cpu_model.dart';
import 'package:gotta_go_fast/models/developer_model.dart';
import 'package:gotta_go_fast/services/console_service.dart';
import 'package:gotta_go_fast/extensions/string_extension.dart';
import 'package:gotta_go_fast/themes/app_themes.dart';
import 'package:provider/provider.dart';

class CPUAddScreen extends StatefulWidget {
  CPUAddScreen({Key key}) : super(key: key);

  @override
  _CPUAddScreenState createState() => _CPUAddScreenState();
}

class _CPUAddScreenState extends State<CPUAddScreen> {
  ConsoleService service = ConsoleService();

  int _currentCompleteStep = 0;
  bool _isValidStep = false;

  int currentStep = 0;
  final int stepsLength = 3;

  // First Step
  TextEditingController consoleNameController = TextEditingController();
  List<String> imagesGamesPath = [];
  String iconConsole;

  // Second Step
  TextEditingController developerNameController = TextEditingController();
  String developerIcon;

  // Third Step
  TextEditingController cpuNameController = TextEditingController();
  TextEditingController cpuDescriptionController = TextEditingController();
  TextEditingController cpuClockController = TextEditingController();
  TextEditingController cpuCoreController = TextEditingController();
  TextEditingController cpuCacheController = TextEditingController();
  TextEditingController cpuFlopsController = TextEditingController();
  TextEditingController cpuURLInfoController = TextEditingController();

  set isValidStep(bool valid) {
    setState(() {
      _isValidStep = valid;
    });
  }

  get isValidStep {
    return _isValidStep;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _stepValue = 0;
    return CustomScaffold(
      title: 'Adicionar Processador',
      body: GradientContainer(
        child: Stepper(
          type: StepperType.horizontal,
          steps: [
            _createStep(
              _stepValue++,
              icon: 'https://image.flaticon.com/icons/svg/808/808513.svg',
              content: CreateConsole(
                icon: iconConsole,
                consoleNameController: consoleNameController,
                onIconChange: (String icon) => iconConsole = icon,
                onImageChange: (List<String> imagesUrls) => imagesGamesPath = imagesUrls,
                onValidStateChange: validStateChange
              )
            ),
            _createStep(_stepValue++,
              icon: 'https://image.flaticon.com/icons/svg/1875/1875574.svg',
              content: CreateDeveloper(
                icon: developerIcon,
                onValidStateChange: validStateChange,
                developerNameController: developerNameController,
                onIconChange: (String icon) => developerIcon = icon,
              )
            ),
            _createStep(_stepValue++,
              icon: 'https://image.flaticon.com/icons/svg/1800/1800448.svg',
              isActive: currentStep == _stepValue,
              content: CreateCPU(
                onValidStateChange: validStateChange,
                cpuNameController: cpuNameController,
                cpuDescriptionController: cpuDescriptionController,
                cpuClockController: cpuClockController,
                cpuCoreController: cpuCoreController,
                cpuCacheController: cpuCacheController,
                cpuFlopsController: cpuFlopsController,
                cpuURLInfoController: cpuURLInfoController
              )
            ),
          ],
          currentStep: currentStep,
          onStepCancel: cancel,
          controlsBuilder: (context, {onStepCancel, onStepContinue}) {
            return Row(
              children: [
                currentStep > 0 ?
                  FlatButton(
                    child: Text('Voltar'),
                    onPressed:  cancel,
                  ) : Container(),
                currentStep < stepsLength -1 ?
                FlatButton(
                  child: Text('Próximo'),
                  onPressed: isValidStep || currentStep < _currentCompleteStep ? next : null,
                ): isValidStep ? Stack(children: [
                  Container(
                    margin: EdgeInsets.only(left: 8.0),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(side: BorderSide(color:  Theme.of(context).accentColor)),
                        onPressed:  next,
                        color: Provider.of<AppThemes>(context).buttonCreateCPU,

                        child: TitleText(
                          text: "Criar!",
                          color: Theme.of(context).accentColor,
                        ),
                      )),
                  Positioned(
                    child: SvgPicture.network(
                      "https://image.flaticon.com/icons/svg/2654/2654598.svg",
                      placeholderBuilder: (context) => Container(
                        child: CircularProgressIndicator(),
                        width: 30,
                        height: 30,
                      ),
                      height: 50,
                    ),
                    top: 5,
                    left: 23,
                  ),
                  SizedBox(height: 60,)
                ]) : Container(),
              ],
            );
          },
          onStepContinue:
              isValidStep || currentStep < _currentCompleteStep ? next : null,
          onStepTapped: changeStep,
        ),
      ),
    );
  }

  Step _createStep(int stepValue,
      {@required String icon,
      @required Widget content,
      bool isActive = false}) {
    return Step(
        title: SvgPicture.network(
          icon,
          placeholderBuilder: (context) => Container(child:CircularProgressIndicator(), width: 30, height: 30,),
          height: 40,
          color:  Provider.of<AppThemes>(context).appBarTitleColor
        ),
        isActive: currentStep == stepValue,
        state: getState(stepValue),
        content: content);
  }

  StepState getState(int step) {
    if (currentStep == step)
      return StepState.editing;
    else if (_currentCompleteStep > step)
      return StepState.complete;
    else if (_currentCompleteStep < step) return StepState.disabled;
    return StepState.indexed;
  }

  void validStateChange(bool valid) {
    isValidStep = valid;
  }

  void cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  void goTo(int step) {
    setState(() => currentStep = step);
  }

  void next() {
    _updateCompletedSteps();
    _updateStep();
  }

  void _updateCompletedSteps() {
    bool isNextTheLast = _currentCompleteStep + 1 == stepsLength;
    if (!isNextTheLast) {
      _currentCompleteStep++;
    }
  }

  void _updateStep() {
    bool isTheLastStep = (currentStep + 1) == stepsLength;

    if (!isTheLastStep) {
      changeStep(currentStep + 1);
    } else {
      completed();
    }
  }

  void changeStep(int step) {
    if (_currentCompleteStep >= step) {
      goTo(step);
    }
    isValidStep = _currentCompleteStep > step;
  }

  void completed() {
    CPUModel cpuModel = _getCPUModel();
    DeveloperModel developer = _getDeveloperModel();
    ConsoleModel consoleModel = _getConsoleModel(cpuModel, developer);

    _saveAndRedirect(consoleModel, developer, '/');
  }

  CPUModel _getCPUModel() {
    return CPUModel(
        infoUrl: cpuURLInfoController.text,
        name: cpuNameController.text,
        cacheSize: cpuCacheController.text,
        clockRate: cpuClockController.text,
        coreAmout: cpuCoreController.text.valueExists
            ? int.parse(cpuCoreController.text)
            : null,
        description: cpuDescriptionController.text,
        flops: cpuFlopsController.text);
  }

  DeveloperModel _getDeveloperModel() {
    return DeveloperModel(
        iconUrl: developerIcon, name: developerNameController.text);
  }

  ConsoleModel _getConsoleModel(CPUModel cpuModel, DeveloperModel developer) {
    return ConsoleModel(
      cpu: cpuModel,
      developer: developer,
      name: consoleNameController.text,
      imagesGamesDevice: imagesGamesPath,
      iconUrl: iconConsole,
    );
  }

  Future<void> _saveAndRedirect(ConsoleModel consoleModel,
      DeveloperModel developerModel, String route) async {
    await service.save(consoleModel);
    // await developerService.save(developerModel);
    Navigator.of(context).pushReplacementNamed(route);
  }
}
