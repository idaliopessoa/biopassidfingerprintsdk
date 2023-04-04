// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/material.dart';

class CustomImageShow extends StatelessWidget {
  double height;
  Uint8List image;
  CustomImageShow({
    Key? key,
    required this.height,
    required this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.memory(
            image,
            fit: BoxFit.cover,
          )),
    );
  }
}
