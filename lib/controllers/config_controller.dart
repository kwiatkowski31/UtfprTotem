import 'package:mobx/mobx.dart';
part 'config_controller.g.dart';

class ConfigController = ConfigControllerBase with _$ConfigController;
//flutter pub run build_runner build

//flutter pub run build_runner watch ~> Monitora e atualiza os Controllers (Obs: Executo ele sempre que abrir o projeto)

abstract class ConfigControllerBase with Store{


  @observable
  bool temaClaroSelecionado = false;

  @observable
  bool temaEscuroSelecionado = false;

  @observable
  bool temaCustomSelecionado = false;

  @observable
  int tipoArmazenamento = 0;

  @observable
  bool tipoArmzLocal = false;
  @observable
  bool tipoArmzWebService = false;

  //ConfigControllerBase(){}
  

  @action
  void setTemaClaro( value ){
    temaClaroSelecionado  = value;//temaClaroSelecionado = !temaClaroSelecionado;
    temaEscuroSelecionado = !value;
    temaCustomSelecionado = !value;
  }

  @action
  void setTemaEscuro( value ){
    temaClaroSelecionado  = !value;
    temaEscuroSelecionado = value;//temaEscuroSelecionado = !temaEscuroSelecionado;
    temaCustomSelecionado = !value;
  }

  @action
  void setTemaCustom( value ){
    temaClaroSelecionado  = !value;
    temaEscuroSelecionado = !value;
    temaCustomSelecionado = value;//temaCustomSelecionado = !temaCustomSelecionado;
  }

  @action
  void setArmazenamento( value ){
    tipoArmazenamento = value;
  }

  @action
  void setArmzLocal( value ){
    tipoArmzLocal = value;
    tipoArmzWebService = !value;
  }

  @action
  void setArmzWebService( value ){
    tipoArmzLocal = !value;
    tipoArmzWebService = value;
  }

}
