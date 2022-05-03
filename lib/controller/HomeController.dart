import 'package:get/get.dart';
import 'package:news_app/services/country_abbreviathion.dart';

class HomeController extends GetxController {
  final List<CountryAbbreviathionModel> countries =
      CountryAbbreviathion().filterByAbbreviation([
    "ae",
    "ar",
    "at",
    "au",
    "be",
    "bg",
    "br",
    "ca",
    "ch",
    "cn",
    "co",
    "cu",
    "cz",
    "de",
    "eg",
    "fr",
    "gb",
    "gr",
    "hk",
    "hu",
    "id",
    "ie",
    "il",
    "in",
    "it",
    "jp",
    "kr",
    "lt",
    "lv",
    "ma",
    "mx",
    "my",
    "ng",
    "nl",
    "no",
    "nz",
    "ph",
    "pl",
    "ro",
    "rs",
    "ru",
    "sa",
    "se",
    "sg",
    "si",
    "sk",
    "th",
    "tr",
    "tw",
    "ua",
    "us",
    "ve",
    "za",
  ]);
  String valueCountry = "AR";

  List<String>category =[
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
  ];
  String valueCategory = "business";

  changeValueCountry(String country) {
    valueCountry = country;
    update();
  }

  changeValueCategory (String category) {
    valueCategory = category;
    update();
  }

}
