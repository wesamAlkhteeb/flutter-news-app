import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNetworkImage extends StatelessWidget {
  CustomNetworkImage({Key? key, required this.tag, required this.urlImage})
      : super(key: key);

  String urlImage, tag;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Image.network(
        urlImage,
        fit: BoxFit.cover,
        errorBuilder: (ctx, ob, load) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/defaultImage.svg",
            ),
          );
        },
      ),
    );
  }
}
