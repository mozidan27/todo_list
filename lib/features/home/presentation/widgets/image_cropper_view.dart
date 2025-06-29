import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageCropperView extends StatefulWidget {
  const ImageCropperView({super.key, required this.image});
  final CroppedFile image;

  @override
  State<ImageCropperView> createState() => _ImageCropperViewState();
}

class _ImageCropperViewState extends State<ImageCropperView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Cropper'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: InteractiveViewer(
            child: Image(image: FileImage(File(widget.image.path))),
          ),
        ),
      ),
    );
  }
}
