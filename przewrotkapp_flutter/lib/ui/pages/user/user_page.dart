import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../../di.dart';
import '../../../logic/data_types.dart';
import '../../common/rental_listing.dart';
import '../../utils/names_and_strings.dart';
import 'social_links.dart';
import 'user_recent_hours_list.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    final sm = context.watch<SessionManager>();
    final rentals = context.watch<FutureRentals?>();
    // PageData stuff
    final pageData = context.select<UserPageCubit, UserPageData>(
      (p) => p.state,
    );
    final userId = pageData.userId;
    final isYou = sm.signedInUser?.id == userId;
    final przeUser = pageData.przeUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(przeUser != null ? przeUser.user!.name : '🟠 Ładowanie...'),
        automaticallyImplyLeading: true,
        actions: isYou
            ? [
                IconButton(
                  onPressed: () =>
                      context.push('/user/$userId/edit', extra: przeUser!),
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
                  : CircularUserImage(userInfo: przeUser?.user, size: 86),
              if (przeUser != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      przeUser.user?.userName ??
                          przeUser.user?.fullName ??
                          "-nieznany-",
                      style: tt.headlineLarge,
                    ),
                    if (przeUser.user?.userName != null &&
                        przeUser.user?.fullName != null)
                      Text(przeUser.user!.fullName!, style: tt.headlineSmall),
                  ],
                ),
            ],
          ),
          Divider(height: 32),
          if (przeUser != null) SocialLinks(przeUser: przeUser),
          Divider(height: 32),
          Text("Najbliższe wypożyczenia:", style: tt.headlineMedium),
          if (rentals != null)
            for (final rental in rentals.where(
              (r) => r.userId == przeUser?.userId,
            ))
              RentalListing(rental: rental)
          else
            Text("🟠 Ładowanie wypożyczeń..."),
          Divider(height: 32),
          Text(
            "Ostatnie godzinki${pageData.hoursSum != null ? ' (${pageData.hoursSum}h)' : ""}:",
            style: tt.headlineMedium,
          ),
          UserRecentHoursList(),
          Divider(height: 32),
          ElevatedButton(
            onPressed: () async {
              await sm.signOutDevice();
              if (context.mounted) {
                while (context.canPop()) {
                  context.pop();
                }
                context.pushReplacement('/signin');
              }
            },
            child: Text(
              "Wyloguj",
              style: tt.bodyMedium?.copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
