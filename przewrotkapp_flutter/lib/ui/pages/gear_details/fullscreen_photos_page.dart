import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

import '../../../data_types.dart';

class FullscreenPhotosPage extends StatelessWidget {
  final String clubId;

  const FullscreenPhotosPage({super.key, required this.clubId});

  @override
  Widget build(BuildContext context) {
    final imageUrls = context
        .watch<AllGearCache?>()
        ?.firstWhereOrNull((g) => g.gear.clubId == clubId)
        ?.gear
        .photoUrls;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withAlpha(100),
        foregroundColor: Colors.white,
      ),
      body: PageView.builder(
        itemCount: imageUrls?.length ?? 0,
        itemBuilder: (context, i) => PhotoViewGestureDetectorScope(
          axis: Axis.horizontal,
          child: PhotoView(
            minScale: PhotoViewComputedScale.contained,
            imageProvider: NetworkImage(imageUrls![i].toString()),
          ),
        ),
      ),
    );
  }
}
