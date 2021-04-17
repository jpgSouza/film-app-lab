import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:film_app_lab/app/modules/home/model/result_film_model.dart';
import 'package:film_app_lab/app/modules/home/repositories/home_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/api/search_film_response.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final repository = HomeRepository(dio);

  group('HomeRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<HomeRepository>());
    });

    test("Should return a list of ResultFilmModel", () async {
      when(dio.get(any, options: anyNamed("options"))).thenAnswer((_) async => Response(data: jsonDecode(searchFilmResponse), statusCode: 200));
      final result = await repository.getFilmByName("Avengers");
      expect(result, isA<List<ResultFilmModel>>());
    });

    test("Should return the correct response data", () async{
      when(dio.get(any, options: anyNamed("options"))).thenAnswer((_) async => Response(data: jsonDecode(searchFilmResponse), statusCode: 200));
      await repository.getFilmByName("name").then((value){
        expect("Inception", value.first.title);
        expect("https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@.jpg", value.first.image);
        expect("tt1375666", value.first.id);
      });
    });
  });
}
