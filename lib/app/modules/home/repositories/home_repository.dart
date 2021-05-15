import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:film_app_lab/app/modules/home/model/result_film_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/home_repository_interface.dart';

part 'home_repository.g.dart';

@Injectable()
class HomeRepository implements IHomeRepository {
  final Dio dio;

  HomeRepository(this.dio);

  @override
  Future<List<ResultFilmModel>> getFilmByName(String name) async {
    final response = await dio.get(
      "https://imdb-internet-movie-database-unofficial.p.rapidapi.com/search/$name",
      options: Options(
        headers: {"x-rapidapi-key":"6630d66094mshff8fae61f126752p1b95bejsn9809b98cbef5"}
      ),
    );
    if(response.statusCode == 200){
      final result = (response.data['titles'] as List).map((json) => ResultFilmModel.fromJson(json)).toList();
      return result;
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
