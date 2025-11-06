import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';

OctoPlaceholderBuilder blurHashPlaceholderBuilder(
  String hash, {
  int? width,
  int? height,
  BoxFit? fit,
}) {
  final ratio = ((width != null && height != null) && (width > 0 && height > 0))
      ? width / height
      : 1.0;
  const defSize = 32;
  final w = defSize * ratio;
  final h = defSize;
  return (context) => Image(
    image: BlurHashImage(
      hash,
      decodingWidth: w.toInt(),
      decodingHeight: h.toInt(),
    ),
    fit: fit ?? BoxFit.fill,
  );
}
