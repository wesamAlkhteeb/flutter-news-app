import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constant/themes.dart';
import 'package:news_app/screen/home_screen/home_screen.dart';
import 'package:news_app/services/country_abbreviathion.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemesServices.light,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}