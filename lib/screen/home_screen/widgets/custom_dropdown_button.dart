import 'package:flutter/material.dart';
import 'package:news_app/constant/size_config.dart';
import 'package:news_app/constant/themes.dart';

class CustomDropDownButton extends StatelessWidget {
  CustomDropDownButton(
      {Key? key,
      required this.data,
      required this.value,
      required this.onChange})
      : super(key: key);

  List<DropDownButtonModel> data;
  Function(String? value) onChange;
  String value;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      isExpanded: true,
      items: data
          .map(
            (item) => DropdownMenuItem(
              value: item.value,
              child: Text(item.title),
            ),
          )
          .toList(),
      onChanged: onChange,
      style: ThemesServices.headerTextStyle
          .copyWith(fontSize: SizeConfig.getPercentWidth(percent: .045)),
      alignment: Alignment.centerRight,
    );
  }
}

class DropDownButtonModel {
  String title, value;

  DropDownButtonModel({required this.title, required this.value});
}
