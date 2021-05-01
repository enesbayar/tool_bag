import 'dart:typed_data';

import 'package:flutter/material.dart';

class GalleryDetailPage extends StatelessWidget {
  final Uint8List image;
  GalleryDetailPage(this.image);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: image,
        child: buildImage(),
      ),
    );
  }

  Widget buildImage() {
    return Center(
      child: Image.memory(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
