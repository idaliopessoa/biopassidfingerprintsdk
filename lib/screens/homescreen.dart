// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:fingerprint_sdk_flutter/fingerprint_sdk_flutter.dart';
import 'package:fingersdk/widgets/custom_appbar.dart';
import 'package:fingersdk/widgets/custom_image_show.dart';
import 'package:fingersdk/widgets/image_hero.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Uint8List? image;
  List listImages = [];

  final config = FingerprintConfig(
    licenseKey: 'GXL6-VCN4-SXWK-4FFI',
    captureType: FingerprintCaptureType.LEFT_HAND_FINGERS,
    outputType: FingerprintOutputType.CAPTURE_AND_SEGMENTATION,
    nFingersToCapture: 4,
    showStatusView: true,
    showDistanceIndicatorView: true,
    showFingersIndicatorView: true,
  );

  IFingerprintCaptureListener listener() => FingerprintCaptureListener(
        onFingerCapture: (List<Uint8List> images) async {
          print('Demo App - onFingerCapture: ${images[0][0]}');
          setState(() => image = images[0]);
          setState(() => listImages = images);
        },
        onCaptureCanceled: () async {
          print('Demo App: onCaptureCanceled');
        },
        onStatusChanged: (FingerprintCaptureState state) async {
          print('Demo App - onStatusChanged: $state');
        },
        onFingerDetected: (List<Rect> displayFingerRects) async {
          print('Demo App - onFingerDetected: $displayFingerRects');
        },
        onClassificationChanged: (String classif) async {
          print('Demo App - onClassificationChanged: $classif');
        },
      );

  void openCamera() async {
    await Fingerprint.buildCameraView(
      config: config,
      listener: listener(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onPressed: openCamera),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              child: image != null && image!.isNotEmpty
                  ? CustomImageShow(height: 500, image: listImages[0])
                  : null,
            ),
            image != null && image!.isNotEmpty
                ? Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 8,
                    spacing: 8,
                    children: [
                      ImageHero(
                          context: context,
                          image: listImages[1],
                          tag: 'photo',
                          widget: PhotoHero(
                            photo: listImages[1],
                            tag: 'photo',
                          )),
                      ImageHero(
                          context: context,
                          image: listImages[2],
                          tag: 'photo2',
                          widget: PhotoHero(
                            photo: listImages[2],
                            tag: 'photo2',
                          )),
                      ImageHero(
                          context: context,
                          image: listImages[3],
                          tag: 'photo3',
                          widget: PhotoHero(
                            photo: listImages[3],
                            tag: 'photo3',
                          )),
                      ImageHero(
                          context: context,
                          image: listImages[4],
                          tag: 'photo4',
                          widget: PhotoHero(
                            photo: listImages[4],
                            tag: 'photo4',
                          )),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero({
    Key? key,
    required this.photo,
    required this.tag,
  }) : super(key: key);

  final Uint8List photo;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finger Details'),
        backgroundColor: const Color.fromRGBO(72, 68, 63, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            child: Hero(
              tag: tag,
              child: Material(
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.memory(
                    photo,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(64, 63, 59, 1),
    );
  }
}
