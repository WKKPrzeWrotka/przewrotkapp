import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

extension GearHandy on Gear {
  Uri? get thumbnailOrFist => thumbnailUrl ?? photoUrls?.firstOrNull;
}

// TODO: A batter place for this some day?
extension CommentTypeStyling on CommentType {
  Color? get backgroundColor => switch (this) {
    CommentType.neutral => null,
    CommentType.warning => Colors.orange.shade200,
    CommentType.broken => Colors.red.shade700,
  };
}

extension UriSly on Uri {
  String? get blurhash => queryParameters['blurhash'];

  int? get width => int.tryParse(queryParameters['width'] ?? '');

  int? get height => int.tryParse(queryParameters['height'] ?? '');
}

Future<void> copyText(String text, BuildContext context) async {
  await FlutterClipboard.copy(text);
  if (context.mounted) {
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
      SnackBar(
        content: Text("Skopiowano $text"),
        duration: Duration(seconds: 1),
      ),
    );
  }
  try {
    await Vibration.vibrate(preset: VibrationPreset.quickSuccessAlert);
  } catch (_) {}
}

bool isMobileScreen(BuildContext context) {
  return MediaQuery.sizeOf(context).width < 850;
}
