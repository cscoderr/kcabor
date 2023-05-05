// ignore_for_file: lines_longer_than_80_chars, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final ImagePicker picker = ImagePicker();

// ignore: always_declare_return_types, inference_failure_on_function_return_type, type_annotate_public_apis
selectProfilePiclSheeet(
  BuildContext context,
  void Function(File? profilePic) profilePicCallback,
) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => CupertinoActionSheet(
      cancelButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            CupertinoActionSheetAction(
              child: Text(
                'Take a Picture with Camera',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onPressed: () async {
                final photo = await picker.pickImage(
                  source: ImageSource.camera,
                  preferredCameraDevice: CameraDevice.front,
                  imageQuality: 50,
                  maxHeight: 612,
                  maxWidth: 816,
                );
                if (photo != null) {
                  profilePicCallback(File(photo.path));
                }
                Navigator.of(context).pop();
                return;
              },
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
              height: 15,
            ),
            CupertinoActionSheetAction(
              child: Text(
                'Select from Gallery',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onPressed: () async {
                final photo = await picker.pickImage(
                  source: ImageSource.gallery,
                  imageQuality: 50,
                  maxHeight: 612,
                  maxWidth: 816,
                );
                if (photo != null) {
                  profilePicCallback(File(photo.path));
                }
                Navigator.of(context).pop();
                return;
              },
            ),
          ],
        ),
      ),
    ),
  );
}
