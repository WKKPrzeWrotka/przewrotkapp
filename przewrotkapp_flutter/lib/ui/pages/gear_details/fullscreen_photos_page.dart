import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullscreenPhotosPage extends StatelessWidget {
  final List<Uri> imageUrls;

  const FullscreenPhotosPage({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withAlpha(100),
        foregroundColor: Colors.white,
      ),
      body: PageView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, i) {
          return PhotoView(
            imageProvider: NetworkImage(imageUrls[i].toString()),
          );
        },
      ),
    );
  }
}
