// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:fingersdk/widgets/custom_image_show.dart';

class ImageHero extends StatelessWidget {
  BuildContext context;
  Uint8List image;
  String tag;
  Widget widget;

  ImageHero({
    Key? key,
    required this.context,
    required this.image,
    required this.tag,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      ),
      child: Hero(
        tag: tag,
        child: CustomImageShow(height: 200, image: image),
      ),
    );
  }
}
