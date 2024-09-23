
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';
/// The route configuration.
final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context,state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/buttons',
      builder: (context,state) {
        return const ButtonsScreen();
      },
    ),
    GoRoute(
      path: '/cards',
      builder: (context,state) {
        return const CardsScreen();
      },
    ),
  ],
);