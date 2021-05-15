import 'package:film_app_lab/app/modules/home/model/result_film_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IHomeRepository implements Disposable {
  Future<List<ResultFilmModel>> getFilmByName(String name);
}
