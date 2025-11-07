import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import 'di.dart';
import 'logic/utils.dart';
import 'ui/pages/calendar/calendar_page.dart';
import 'ui/pages/comments_browser/comments_browser_page.dart';
import 'ui/pages/gear_browser/gear_browser_page.dart';
import 'ui/pages/gear_details/fullscreen_photos_page.dart';
import 'ui/pages/gear_details/gear_details_page.dart';
import 'ui/pages/gear_details/gear_edit_page.dart';
import 'ui/pages/home/home_page.dart';
import 'ui/pages/hours/hours_edit_page.dart';
import 'ui/pages/new_rental/new_rental_page.dart';
import 'ui/pages/rental_group_details/rental_group_details_page.dart';
import 'ui/pages/sign_in/sign_in_page.dart';
import 'ui/pages/user/user_edit_page.dart';
import 'ui/pages/user/user_page.dart';

void initRouter() {
  // Yeah this broke some stuff
  // May think about it in future
  // GoRouter.optionURLReflectsImperativeAPIs = true;
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
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(path: '/gear', builder: (context, state) => GearBrowserPage()),
    GoRoute(
      path: '/gear/:clubId',
      builder: (context, state) => GearDetailsPage(clubId: state.pathParameters['clubId']!),
    ),
    GoRoute(
      path: '/gear/:clubId/photos',
      builder: (context, state) =>
          FullscreenPhotosPage(clubId: state.pathParameters['clubId']!, initialIndex: int.tryParse(state.uri.queryParameters['initialIndex'] ?? "")),
    ),
    GoRoute(
      path: '/gear/:clubId/edit',
      builder: (_, state) => GearEditPage(
        clubId: state.pathParameters['clubId']!,
        gearPair: state.extra as GearPair,
        emptyFields: bool.tryParse(state.uri.queryParameters['emptyFields'] ?? 'false') ?? false,
      ),
    ),
    GoRoute(path: '/calendar', builder: (context, state) => CalendarPage()),
    GoRoute(
      path: '/user/:userId',
      builder: (context, state) => BlocProvider(
        lazy: false,
        create: (_) => UserPageCubit(userId: int.parse(state.pathParameters['userId']!)),
        child: UserPage(),
      ),
    ),
    GoRoute(
      path: '/user/:userId/edit',
      builder: (context, state) => UserEditPage(przeUser: state.extra as PrzeUser),
    ),
    GoRoute(path: '/hours/edit', builder: (context, state) => HoursEditPage(
        hour: state.extra as Hour,
        emptyFields:
            bool.tryParse(state.uri.queryParameters['emptyFields'] ?? 'true') ??
            true,
      )),
    GoRoute(
      path: '/rentals/new',
      builder: (context, state) {
        final init = state.uri.queryParameters.containsKey('initialRange') ? DateTimeRangeParsing.parseDateRangeString(state.uri.queryParameters['initialRange']!) : null;
        return NewRentalPage(initialRange: init);
      },
    ),
    GoRoute(
      path: '/rentals/group/:range',
      builder: (context, state) {
        return RentalGroupDetailsPage(range: DateTimeRangeParsing.parseDateRangeString(state.pathParameters['range']!));
      },
    ),
    GoRoute(path: '/comments', builder: (_, _) => CommentsBrowserPage()),
    GoRoute(
      path: '/signin',
      redirect: (context, _) {
        if (context.read<SessionManager>().isSignedIn) {
          return '/';
        } else {
          return null;
        }
      },
      builder: (context, state) => SignInPage(caller: context.read<Client>().modules.auth, onSignedIn: () => context.go('/')),
    ),
  ],
);
