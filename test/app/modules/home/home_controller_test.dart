import 'package:dartz/dartz.dart';
import 'package:film_app_lab/app/modules/home/model/result_film_model.dart';
import 'package:film_app_lab/app/shared/constants/error/error.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:film_app_lab/app/modules/home/home_controller.dart';
import 'package:film_app_lab/app/modules/home/home_module.dart';
import 'package:mockito/mockito.dart';

class HomeControllerMock extends Mock implements HomeController{}

void main() {
  initModule(HomeModule());
  HomeControllerMock home;

  setUp(() {
    home = HomeControllerMock();
  });

  group('HomeController Test', () {
    test("First Test", () {
      expect(home, isInstanceOf<HomeController>());
    });

    test("Should return a list of results", () async {
      when(home.fetchData(any)).thenAnswer((_) async => Right(<ResultFilmModel>[]));
      final result = await home.fetchData("searchText");
      expect(result, isA<Right>());
    });

    test("Should return an EmptyTextError", () async {
      when(home.fetchData(any)).thenAnswer((_) async => Left(EmptyTextError()));
      final result = await home.fetchData("searchText");
      expect(result, isA<Left>());
    });

  });
}
