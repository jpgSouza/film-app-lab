import 'package:film_app_lab/app/shared/constants/error/error.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:film_app_lab/app/modules/home/home_controller.dart';
import 'package:film_app_lab/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  HomeController home;

  setUp(() {
    home = HomeModule.to.get<HomeController>();
  });

  group('HomeController Test', () {
    test("First Test", () {
      expect(home, isInstanceOf<HomeController>());
    });

    test("Should return a list of results", (){
      var filmResult = home.fetchData(searchText: "Inception");
      expect(filmResult, [""]);
    });

    test("Should throw an 'EmptyTextError'", (){
      expect(() => home.fetchData(searchText: ""), throwsA(isA<EmptyTextError>()));
    });

  });
}
