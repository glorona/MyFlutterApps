
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
    GoRoute(
      name: ProgressScreen.name,
      path: '/progress',
      builder: (context,state) {
        return const ProgressScreen();
      },
    ),
    GoRoute(
      name: SnackbarScreen.name,
      path: '/snackbars',
      builder: (context,state) {
        return const SnackbarScreen();
      },
    ),
    GoRoute(
      name: AnimatedScreen.name,
      path: '/animated',
      builder: (context,state) {
        return const AnimatedScreen();
      },
    ),
    GoRoute(
      name: UiControlsScreen.name,
      path: '/ui-controls',
      builder: (context,state) {
        return const UiControlsScreen();
      },
    ),
    GoRoute(
      name: AppTutorialScreen.name,
      path: '/tutorial',
      builder: (context,state) {
        return const AppTutorialScreen();
      },
    ),
    GoRoute(
      name: InfiniteScrollScreen.name,
      path: '/infinite',
      builder: (context,state) {
        return const InfiniteScrollScreen();
      },
    ),
    GoRoute(
      name: CounterScreen.name,
      path: '/counter',
      builder: (context,state) {
        return const CounterScreen();
      },
    ),
    GoRoute(
      name: ThemeScreen.name,
      path: '/theme',
      builder: (context,state) {
        return const ThemeScreen();
      },
    ),
  ],
);