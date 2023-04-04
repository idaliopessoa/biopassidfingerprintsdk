// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  void Function() onPressed;
  @override
  final Size preferredSize = const Size.fromHeight(50.0);
  CustomAppBar({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Fingerprint SDK'),
      backgroundColor: const Color.fromRGBO(72, 68, 63, 1),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.horizontal(
                        end: Radius.circular(50), start: Radius.circular(50)))),
            child: Row(
              children: const [
                Icon(Icons.camera_alt, color: Color.fromRGBO(36, 37, 38, 1)),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'Capture Fingers',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(36, 37, 38, 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
