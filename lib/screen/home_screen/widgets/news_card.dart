import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/constant/size_config.dart';
import 'package:news_app/constant/themes.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/screen/home_screen/widgets/CustomNetworkImage.dart';

class NewsCard extends StatelessWidget {
  NewsCard({Key? key, required this.newsModel}) : super(key: key);

  NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.getPercentWidth(percent: .9),
      height: SizeConfig.getPercentWidth(percent: .3),
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.getPercentHeight(percent: .01),
        horizontal: SizeConfig.getPercentWidth(percent: .03),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!,
              // blurStyle: BlurStyle.normal,
              blurRadius: 7,
              offset: Offset(3, 3),
            ),
            BoxShadow(
              color: Colors.grey[200]!,
              // blurStyle: BlurStyle.normal,
              blurRadius: 7,
              offset: Offset(-3, -3),
            ),
          ]),
      child: Row(
        children: [
          SizedBox(
            width: SizeConfig.getPercentWidth(percent: 0.04),
          ),
          Column(
            children: [
              const Spacer(flex: 2,),
              SizedBox(
                width: SizeConfig.getPercentWidth(percent: .4),
                child: Text(
                  newsModel.nameSource ?? "Not Add name source",
                  style: ThemesServices.headerTextStyle,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: SizeConfig.getPercentWidth(percent: .4),
                child: Text(
                  newsModel.author ?? "Not Add Author",
                  style: ThemesServices.headerTextStyle,
                ),
              ),
              const Spacer(flex: 2,),
              SizedBox(
                width: SizeConfig.getPercentWidth(percent: .4),
                child: Text(
                  newsModel.description ?? "Not Add description",
                  style: ThemesServices.subLongTextStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const Spacer(flex: 2,),
            ],
          ),
          const Spacer(),
          Container(
            width: SizeConfig.getPercentWidth(percent: .3),
            height: SizeConfig.getPercentHeight(percent: .3),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: LayoutBuilder(builder: (ctx, constrain) {
              return newsModel.urLImage == null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/defaultImage.svg",
                      ),
                    )
                  : ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: CustomNetworkImage(tag: newsModel.toString(),urlImage: newsModel.urLImage!,)
                    );
            }),
          ),
        ],
      ),
    );
  }
}
