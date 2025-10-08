import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../../logic/data_types.dart';
import '../../common/rental_listing.dart';
import '../../utils/names_and_strings.dart';
import 'social_links.dart';

class UserPage extends StatefulWidget {
  final int userId;

  const UserPage({super.key, required this.userId});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    final sm = context.watch<SessionManager>();
    final rentals = context.watch<FutureRentals?>();
    final isYou = sm.signedInUser?.id == widget.userId;
    return StreamBuilder(
      stream: context.read<Client>().user.watchExtraUserInfo(widget.userId),
      builder: (context, snap) {
        final extraUser = snap.hasData ? snap.data : null;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              extraUser != null ? extraUser.userInfo!.name : '🟠 Ładowanie...',
            ),
            automaticallyImplyLeading: true,
            actions: isYou
                ? [
                    IconButton(
                      onPressed: () => context.push(
                        '/user/${widget.userId}/edit',
                        extra: extraUser!,
                      ),
                      icon: Icon(Icons.edit),
                    ),
                  ]
                : null,
          ),
          body: ListView(
            padding: EdgeInsets.all(6),
            children: [
              Wrap(
                spacing: 6,
                children: [
                  isYou
                      ? SizedBox(
                          width: 86,
                          height: 86,
                          child: UserImageButton(
                            sessionManager: sm,
                            compact: false,
                          ),
                        )
                      : CircularUserImage(
                          userInfo: extraUser?.userInfo,
                          size: 86,
                        ),
                  if (extraUser != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          extraUser.userInfo?.userName ??
                              extraUser.userInfo?.fullName ??
                              "-nieznany-",
                          style: tt.headlineLarge,
                        ),
                        if (extraUser.userInfo?.userName != null &&
                            extraUser.userInfo?.fullName != null)
                          Text(
                            extraUser.userInfo!.fullName!,
                            style: tt.headlineSmall,
                          ),
                      ],
                    ),
                ],
              ),
              Divider(height: 32),
              if (extraUser != null) SocialLinks(extraUser: extraUser),
              Divider(height: 32),
              if (rentals?.isNotEmpty ?? false)
                Text("Najbliższe wypożyczenia:", style: tt.headlineMedium),
              if (rentals != null)
                for (final rental in rentals.where(
                  (r) => r.userInfoId == extraUser?.userInfoId,
                ))
                  RentalListing(rental: rental)
              else
                Text("🟠 Ładowanie wypożyczeń..."),
            ],
          ),
        );
      },
    );
  }
}
