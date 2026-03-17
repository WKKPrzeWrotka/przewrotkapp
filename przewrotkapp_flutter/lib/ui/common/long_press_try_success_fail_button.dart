import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

class LongPressTrySuccessFailButton extends StatefulWidget {
  final Widget child;
  final ButtonStyle? style;
  final FutureOr<void> Function() onTry;
  final FutureOr<void> Function()? onSuccess;
  final FutureOr<void> Function()? onFail;

  const LongPressTrySuccessFailButton({
    super.key,
    required this.child,
    this.style,
    required this.onTry,
    this.onSuccess,
    this.onFail,
  });

  @override
  State<LongPressTrySuccessFailButton> createState() =>
      _LongPressTrySuccessFailButtonState();
}

class _LongPressTrySuccessFailButtonState
    extends State<LongPressTrySuccessFailButton> {
  var trying = false;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: widget.style,
      onPressed: !trying
          ? () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(milliseconds: 750),
                content: Text("Przytrzymaj :)"),
              ),
            )
          : null,
      onLongPress: !trying
          ? () async {
              try {
                trying = true;
                setState(() {});
                try {
                  Vibration.vibrate(preset: VibrationPreset.singleShortBuzz);
                } catch (_) {}
                await widget.onTry();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 3),
                      backgroundColor: Colors.green.shade600,
                      content: Text("Udało się!"),
                    ),
                  );
                }
                if (widget.onSuccess != null) await widget.onSuccess!();
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 5),
                      backgroundColor: Colors.red.shade800,
                      content: Text("Błąd: $e"),
                    ),
                  );
                }
                if (widget.onFail != null) await widget.onFail!();
              } finally {
                trying = false;
                setState(() {});
              }
            }
          : null,
      child: !trying
          ? widget.child
          // This makes the loading circle take same size as child would
          : Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Opacity(opacity: 0, child: widget.child),
                Positioned.fill(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
