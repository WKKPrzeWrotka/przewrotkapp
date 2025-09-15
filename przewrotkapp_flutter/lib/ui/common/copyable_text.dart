import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

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
      onLongPress: () {
        FlutterClipboard.copy(t!);
        final msg = ScaffoldMessenger.maybeOf(context);
        if (msg != null) {
          msg.showSnackBar(
            SnackBar(
              content: Text("Copied to clipboard!"),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      child: child,
    );
  }
}
