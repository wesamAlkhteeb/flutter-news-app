
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/constant/size_config.dart';
import 'package:news_app/constant/themes.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/screen/home_screen/widgets/CustomNetworkImage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_android/url_launcher_android.dart';


class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.newsModel}) : super(key: key);

  NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: SizeConfig.getPercentWidth(percent: 1),
              height: SizeConfig.getPercentHeight(percent: .5),
              color: Colors.grey,
              child: newsModel.urLImage != null
                  ? CustomNetworkImage(
                      tag: newsModel.toString(),
                      urlImage: newsModel.urLImage!,
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/defaultImage.svg",
                      ),
                    ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.getPercentWidth(percent: .01),
                    vertical: SizeConfig.getPercentHeight(percent: .01),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Name Source : ",
                              style: ThemesServices.detailTextStyle,
                            ),
                            Text(
                              newsModel.nameSource??" No found name source ",
                              style: ThemesServices.subDetailTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.getPercentHeight(percent: .03),),
                        Row(
                          children: [
                            Text(
                              "Author : ",
                              style: ThemesServices.detailTextStyle,
                            ),
                            Text(
                              newsModel.author ?? " No found name author ",
                              style: ThemesServices.subDetailTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.getPercentHeight(percent: .03),),
                        Text(
                          "Description : ",
                          style: ThemesServices.detailTextStyle,
                        ),
                        SizedBox(height: SizeConfig.getPercentHeight(percent: .01),),
                        Text(
                          newsModel.description??" No found description ",
                          style: ThemesServices.subDetailTextStyle,
                        ),
                        SizedBox(height: SizeConfig.getPercentHeight(percent: .03),),
                        Text(
                          "Content : ",
                          style: ThemesServices.detailTextStyle,
                        ),
                        SizedBox(height: SizeConfig.getPercentHeight(percent: .01),),
                        Text(
                          newsModel.content??" No found Content ",
                          style: ThemesServices.subDetailTextStyle,
                        ),
                        SizedBox(height: SizeConfig.getPercentHeight(percent: .03),),
                        Text(
                          "More Information : ",
                          style: ThemesServices.detailTextStyle,
                        ),
                        SizedBox(height: SizeConfig.getPercentHeight(percent: .01),),
                        GestureDetector(
                          onTap: ()async{
                            String url = newsModel.moreInformaion!;
                            if(await canLaunchUrl(Uri.parse(url))){
                              await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication);
                            }
                          },
                          child: Text(
                            newsModel.moreInformaion!,
                            style: ThemesServices.headerTextStyle.copyWith(
                              decoration: TextDecoration.underline,
                              color: Colors.blueAccent,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
