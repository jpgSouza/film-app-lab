import 'package:film_app_lab/app/shared/constants/color/app_colors.dart';
import 'package:film_app_lab/app/shared/constants/dimens/app_dimens.dart';
import 'package:film_app_lab/app/shared/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.LIGHT_BLUE,
      appBar: AppBar(
        backgroundColor: AppColors.DARKER_BLUE,
        title: Text(
          "Home",
          style: TextStyle(
            fontSize: AppDimens.TITLE_FONT_SIZE,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 45.0,
              margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 45.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: TextField(
                onSubmitted: (value) {
                  controller.fetchData(value);
                },
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: AppDimens.DEFAULT_FONT_SIZE,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.search,
                    size: 30.0,
                  ),
                  hintText: "Search...",
                  hintStyle: TextStyle(color: AppColors.GRAY),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                ),
              ),
            ),
            Observer(builder: (_) {
              if (controller.state == DataState.IDLE) return SizedBox();
              if (controller.state == DataState.LOADING) return Center(child: CircularProgressIndicator());
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      top: 30.0,
                      left: 40.0,
                      right: 40.0,
                    ),
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: ListTile(
                        onTap: () {},
                        title: Text(
                          controller.films[index].title,
                          style: TextStyle(
                            fontSize: AppDimens.DEFAULT_FONT_SIZE,
                            color: AppColors.BLUE,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: AppColors.BLUE,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) {
                  return SizedBox(height: 8.0);
                },
                itemCount: controller.films.length,
              );
            })
          ],
        ),
      ),
    );
  }
}
