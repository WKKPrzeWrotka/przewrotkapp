import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

import '../../../logic/data_types.dart';

class FullscreenPhotosPage extends StatefulWidget {
  final String clubId;
  final int? initialIndex;

  const FullscreenPhotosPage({
    super.key,
    required this.clubId,
    this.initialIndex,
  });

  @override
  State<FullscreenPhotosPage> createState() => _FullscreenPhotosPageState();
}

class _FullscreenPhotosPageState extends State<FullscreenPhotosPage> {
  late final PageController ctrl;

  @override
  void initState() {
    super.initState();
    ctrl = PageController(initialPage: widget.initialIndex ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    final imageUrls = context
        .watch<AllGearCache?>()
        ?.firstWhereOrNull((g) => g.gear.clubId == widget.clubId)
        ?.gear
        .photoUrls;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withAlpha(100),
        foregroundColor: Colors.white,
      ),
      body: KeyboardListener(
        focusNode: FocusNode(),
        onKeyEvent: (event) {
          if (imageUrls == null ||
              ctrl.page == null ||
              event is! KeyDownEvent) {
            return;
          }
          if (event.logicalKey == LogicalKeyboardKey.arrowRight &&
              ctrl.page!.toInt() != imageUrls.length - 1) {
            ctrl.jumpToPage(ctrl.page!.toInt() + 1);
          } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft &&
              ctrl.page!.toInt() != 0) {
            ctrl.jumpToPage(ctrl.page!.toInt() - 1);
          }
        },
        child: PageView.builder(
          controller: ctrl,
          itemCount: imageUrls?.length ?? 0,
          itemBuilder: (context, i) => PhotoViewGestureDetectorScope(
            axis: Axis.horizontal,
            child: PhotoView(
              minScale: PhotoViewComputedScale.contained,
              imageProvider: NetworkImage(imageUrls![i].toString()),
            ),
          ),
        ),
      ),
    );
  }
}
