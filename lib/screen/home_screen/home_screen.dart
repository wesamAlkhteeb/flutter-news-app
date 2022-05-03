import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/backend/new_endpoint.dart';
import 'package:news_app/constant/size_config.dart';
import 'package:news_app/constant/themes.dart';
import 'package:news_app/controller/HomeController.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/screen/detail_screen/detail_screen.dart';
import 'package:news_app/screen/home_screen/widgets/custom_dropdown_button.dart';
import 'package:news_app/screen/home_screen/widgets/news_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    SizeConfig(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News"),
          actions: [
            GestureDetector(
              onTap: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Filter'),
                      content: SingleChildScrollView(
                        child: GetBuilder<HomeController>(builder: (context) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Country : ",
                                style: ThemesServices.headerTextStyle.copyWith(
                                    fontSize: SizeConfig.getPercentWidth(
                                        percent: .055)),
                              ),
                              SizedBox(
                                width: SizeConfig.getPercentWidth(percent: .6),
                                child: CustomDropDownButton(
                                  data: homeController.countries
                                      .map((country) => DropDownButtonModel(
                                          title: country.country,
                                          value: country.abbreviation))
                                      .toList(),
                                  value: homeController.valueCountry,
                                  onChange: (value) {
                                    homeController.changeValueCountry(value!);
                                  },
                                ),
                              ),
                              Text(
                                "Category : ",
                                style: ThemesServices.headerTextStyle.copyWith(
                                    fontSize: SizeConfig.getPercentWidth(
                                        percent: .055)),
                              ),
                              SizedBox(
                                width: SizeConfig.getPercentWidth(percent: .6),
                                child: CustomDropDownButton(
                                  data: homeController.category
                                      .map((country) => DropDownButtonModel(
                                          title: country, value: country))
                                      .toList(),
                                  value: homeController.valueCategory,
                                  onChange: (value) {
                                    homeController.changeValueCategory(value!);
                                  },
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            'Ok',
                            style: ThemesServices.smallButtonTextStyle,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: SizedBox(
                width: SizeConfig.getPercentWidth(percent: .15),
                child: LayoutBuilder(builder: (context, constrain) {
                  return Padding(
                    padding: EdgeInsets.all(constrain.maxWidth * .0001),
                    child: Icon(Icons.filter_list,
                        size: constrain.biggest.width * .65),
                  );
                }),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.getPercentHeight(percent: .05)),
          child: GetBuilder<HomeController>(builder: (context) {
            return FutureBuilder<List<NewsModel>>(
              future: NewsEndPoint.getNews(
                  homeController.valueCategory, homeController.valueCountry),
              builder: (builder, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (contextListView, indexListView) {
                      return GestureDetector(
                        child:
                            NewsCard(newsModel: snapshot.data![indexListView]),
                        onTap: (){
                          Get.to(DetailScreen(newsModel: snapshot.data![indexListView]));
                        },
                      );
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(builder).primaryColor,
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
