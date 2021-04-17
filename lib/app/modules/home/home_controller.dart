import 'package:dartz/dartz.dart';
import 'package:film_app_lab/app/modules/home/model/result_film_model.dart';
import 'package:film_app_lab/app/shared/constants/error/error.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'repositories/home_repository.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  //ESCOPO
  //final searchTextController = TextEditingController();
  final HomeRepository _repository;
  _HomeControllerBase(this._repository);

  Future<Either<FailureSearch, List<ResultFilmModel>>> fetchData(String searchText) async {
    if (searchText.isNotEmpty || searchText != null) {
      final result = await _repository.getFilmByName(searchText);
      return Right(result);
    }
    return Left(EmptyTextError());
  }
}
