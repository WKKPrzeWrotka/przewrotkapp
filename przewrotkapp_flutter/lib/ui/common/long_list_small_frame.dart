import 'package:flutter/material.dart';

class LongListSmallFrame extends StatelessWidget {
  final double maxHeight;
  final Widget ifEmpty;
  final List<Widget> children;
  final ctrl = ScrollController();

  LongListSmallFrame({
    super.key,
    this.maxHeight = 200.0,
    required this.ifEmpty,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Scrollbar(
        controller: ctrl,
        thumbVisibility: true,
        trackVisibility: true,
        thickness: 8,
        interactive: true,
        child: SingleChildScrollView(
          controller: ctrl,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: children.isEmpty
                ? [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8),
                      child: ifEmpty,
                    ),
                  ]
                : children,
          ),
        ),
      ),
    );
  }
}
