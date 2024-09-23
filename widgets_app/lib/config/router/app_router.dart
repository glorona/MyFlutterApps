
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';
/// The route configuration.
final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (context,state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      name: ButtonsScreen.name,
      path: '/buttons',
      builder: (context,state) {
        return const ButtonsScreen();
      },
    ),
    GoRoute(
      name: CardsScreen.name,
      path: '/cards',
      builder: (context,state) {
        return const CardsScreen();
      },
    ),
  ],
);