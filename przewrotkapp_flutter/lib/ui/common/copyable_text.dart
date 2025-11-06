import 'package:flutter/material.dart';

import '../utils/ui_ux_stuff.dart';

class CopyableText extends StatelessWidget {
  final Widget child;
  final String? text;

  const CopyableText({super.key, this.text, required this.child});

  @override
  Widget build(BuildContext context) {
    var t = text;
    if (t == null && child is Text) {
      t = (child as Text).data;
    }
    assert(t != null);
    return GestureDetector(
      onLongPress: () => copyText(t!, context),
      child: child,
    );
  }
}
