import 'package:film_app_lab/app/shared/constants/error/error.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  //ESCOPO
  //final searchTextController = TextEditingController();
  //final HomeRepository _repository;
  //_HomeControllerBase(this._repository);

  List<String> fetchData({String searchText}) {
    if (searchText.isNotEmpty) {
      return [""];
    }else{
      throw EmptyTextError();
    }
    //_repository.getFilmeByName(searchText);
  }
}
