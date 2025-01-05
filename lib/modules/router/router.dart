import 'package:aurate/export.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (context, state) {
        return const AuthWrapper();
      },
      routes: [
        GoRoute(
          path: '/history',
          builder: (context, state) {
            return History();
          },
        ),
        GoRoute(
          path: '/gold-coin',
          builder: (context, state) {
            return GoldCoin();
          },
        ),
        GoRoute(
          path: '/gold-jewellery',
          builder: (context, state) {
            return GoldJewelery();
          },
        ),
        GoRoute(
          path: '/setting',
          builder: (context, state) => SettingScreen(),
        ),
      ]),
]);
