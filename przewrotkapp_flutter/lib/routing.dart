import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_flutter/ui/pages/new_rental_page.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import 'ui/pages/calendar_page.dart';
import 'ui/pages/gear_browser/gear_browser_page.dart';
import 'ui/pages/home_page/home_page.dart';
import 'ui/pages/sign_in/sign_in_page.dart';
import 'ui/pages/user/user_page.dart';

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
      path: '/newRental',
      builder: (context, state) => NewRentalPage(),
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
