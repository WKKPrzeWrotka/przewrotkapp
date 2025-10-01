import 'package:flutter/material.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../utils/ui_ux_stuff.dart';

class SocialLinks extends StatelessWidget {
  final ExtraUserInfo extraUser;

  const SocialLinks({super.key, required this.extraUser});

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
        if (extraUser.phoneNumber != null)
          FilledButton(
            onPressed: () => launchUrlString('tel:${extraUser.phoneNumber}'),
            // todo: separate function to also show snackbar when coping something
            onLongPress: () => copyText(extraUser.phoneNumber!, context),
            child: Text("📞 ${extraUser.phoneNumber}"),
          ),
        if (extraUser.userInfo?.email != null)
          ElevatedButton(
            onPressed: () =>
                launchUrlString('mailto:${extraUser.userInfo!.email!}'),
            onLongPress: () => copyText(extraUser.userInfo!.email!, context),
            child: Text(extraUser.userInfo!.email!),
          ),
        // if (extraUser.discordUsername != null)
        //   FilledButton(
        //     // this shit for now, because opening user requires special
        //     // discord number id
        //     // actually this messes up my db plans >:(
        //     onPressed: () => FlutterClipboard.copy(extraUser.discordUsername!),
        //     child: Text("Discord: ${extraUser!.discordUsername}"),
        //   ),
        for (final social in extraUser.socialLinks.entries)
          TextButton(
            onPressed: () => launchUrl(social.value),
            onLongPress: () => copyText(social.value.toString(), context),
            child: Text('${socialNameToEmoji(social.key)}  ${social.value}'),
          ),
      ],
    );
  }
}
