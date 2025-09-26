import 'package:przewrotkapp_client/przewrotkapp_client.dart';

extension GearHandy on Gear {
  Uri? get thumbnailOrFist => thumbnailUrl ?? photoUrls?.firstOrNull;
}

extension UriSly on Uri {
  String? get blurhash => queryParameters['blurhash'];

  int? get width => int.tryParse(queryParameters['width'] ?? '');

  int? get height => int.tryParse(queryParameters['height'] ?? '');
}
