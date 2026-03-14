import 'package:flutter/material.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../utils/ui_ux_stuff.dart';

class SocialLinks extends StatelessWidget {
  final PrzeUser przeUser;

  const SocialLinks({super.key, required this.przeUser});

  String socialNameToEmoji(String name) => switch (name.toLowerCase()) {
    'instagram' => '📷',
    'facebook' => '👥',
    'messenger' => '💬',
    'github' => '🧑‍💻',
    _ => '🔗 $name',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        if (przeUser.phoneNumber != null)
          FilledButton(
            onPressed: () => launchUrlString('tel:${przeUser.phoneNumber}'),
            onLongPress: () => copyText(przeUser.phoneNumber!, context),
            child: Text(
              "📞 ${przeUser.phoneNumber?.replaceAllMapped(RegExp(r".{3}"), (match) => "${match.group(0)} ").trimRight()}",
            ),
          ),
        if (przeUser.user?.email != null)
          ElevatedButton(
            onPressed: () => launchUrlString('mailto:${przeUser.user!.email!}'),
            onLongPress: () => copyText(przeUser.user!.email!, context),
            child: Text(przeUser.user!.email!),
          ),
        for (final social in przeUser.socialLinks.entries)
          TextButton(
            onPressed: () => launchUrl(social.value),
            onLongPress: () => copyText(social.value.toString(), context),
            child: Text('${socialNameToEmoji(social.key)}  ${social.value}'),
          ),
      ],
    );
  }
}
