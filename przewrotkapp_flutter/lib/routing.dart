import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import 'ui/common/utils.dart';
import 'ui/pages/calendar/calendar_page.dart';
import 'ui/pages/gear_browser/gear_browser_page.dart';
import 'ui/pages/gear_details/fullscreen_photos_page.dart';
import 'ui/pages/gear_details/gear_details_page.dart';
import 'ui/pages/home/home_page.dart';
import 'ui/pages/new_rental/new_rental_page.dart';
import 'ui/pages/rental_group_details/rental_group_details_page.dart';
import 'ui/pages/sign_in/sign_in_page.dart';
import 'ui/pages/user/user_page.dart';

void initRouter() {
  GoRouter.optionURLReflectsImperativeAPIs = true;
}

final router = GoRouter(
  redirect: (context, state) {
    if (!context.read<SessionManager>().isSignedIn) {
      return '/signin';
    } else {
      return null;
    }
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/gear',
      builder: (context, state) => GearBrowserPage(),
    ),
    GoRoute(
      path: '/gear/:clubId',
      builder: (context, state) =>
          GearDetailsPage(clubId: state.pathParameters['clubId']!),
    ),
    GoRoute(
      path: '/gear/:clubId/photos',
      builder: (context, state) => FullscreenPhotosPage(
        clubId: state.pathParameters['clubId']!,
        initialIndex:
            int.tryParse(state.uri.queryParameters['initialIndex'] ?? ""),
      ),
    ),
    GoRoute(
      path: '/calendar',
      builder: (context, state) => CalendarPage(),
    ),
    GoRoute(
      path: '/user/:userId',
      builder: (context, state) => UserPage(
        userId: int.parse(
          state.pathParameters['userId']!,
        ),
      ),
    ),
    GoRoute(
      path: '/rentals/new',
      builder: (context, state) => NewRentalPage(),
    ),
    GoRoute(
      path: '/rentals/group/:range',
      builder: (context, state) {
        final dates = state.pathParameters['range']!
            .split(RentalGroupDetailsPage.dateSeparator)
            .map((e) => RentalGroupDetailsPage.dateFormat.parse(e))
            .toList();
        return RentalGroupDetailsPage(
          from: dates[0].withDefaultRentalFromTime(),
          to: dates[1].withDefaultRentalToTime(),
        );
      },
    ),
    GoRoute(
      path: '/signin',
      redirect: (context, __) {
        if (context.read<SessionManager>().isSignedIn) {
          return '/';
        } else {
          return null;
        }
      },
      builder: (context, state) => SignInPage(),
    ),
  ],
);
