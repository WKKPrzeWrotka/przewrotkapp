import 'package:flutter/material.dart';

/// UWAGA: Jak widać po super opisie niżej, ten widget był pisany 100% czatem
///
/// Prawdpodobnie (na pewno) ma kilka bugów i nie jest foolproof, ale jako tako
/// działa, a na pewno lepiej niż to co było wcześniej
///
/// Have fun 😊
///
/// A SliverAppBar that automatically measures its height based on [flexibleContent].
///
/// Features:
/// - Dynamic height based on child widget (handles Wrap, Column, etc.)
/// - Re-measures on screen resize/orientation change
/// - Floating behavior: reappears instantly when scrolling up
/// - Snap behavior: fully reveals on small scroll up
class PrzeSliverAppBar extends StatefulWidget {
  final Widget title;
  final Widget flexibleContent;
  final List<Widget>? actions;

  const PrzeSliverAppBar({
    super.key,
    required this.title,
    required this.flexibleContent,
    this.actions,
  });

  @override
  State<PrzeSliverAppBar> createState() => _PrzeSliverAppBarState();
}

class _PrzeSliverAppBarState extends State<PrzeSliverAppBar> {
  final GlobalKey _contentKey = GlobalKey();
  double _expandedHeight = 300; // fallback
  double _lastWidth = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _measure());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentWidth = MediaQuery.of(context).size.width;
    if (_lastWidth != 0 && _lastWidth != currentWidth) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _measure());
    }
    _lastWidth = currentWidth;
  }

  void _measure() {
    final renderBox =
        _contentKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null && mounted) {
      setState(() {
        _expandedHeight = renderBox.size.height + kToolbarHeight + 16;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: true,
      expandedHeight: _expandedHeight,
      toolbarHeight: kToolbarHeight,
      title: widget.title,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.only(top: kToolbarHeight, left: 8, right: 8),
        expandedTitleScale: 1,
        title: OverflowBox(
          maxHeight: double.infinity,
          alignment: Alignment.topCenter,
          child: Container(key: _contentKey, child: widget.flexibleContent),
        ),
      ),
      actions: widget.actions,
    );
  }
}
