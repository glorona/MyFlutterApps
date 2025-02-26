import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/home/0', routes: [
  GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        int pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        if (pageIndex > 2 || pageIndex < 0) {
          pageIndex = 0;
        }

        return HomeScreen(
          pageIndex: pageIndex,
        );
      },
      //Child routes! Permite volver al home desde una ruta particular
      routes: [
        GoRoute(
            path: 'movie/:id', //Para enviar parametro
            name: MovieScreen.name,
            builder: (context, state) {
              final movieId = state.pathParameters['id'] ?? 'no-id';

              return MovieScreen(movieId: movieId);
            }),
      ]),

  //Redireccionadores para ruta principal, evitar errores de no poder volver al home.
  //Guiones bajos para proporcionar argumentos que no nos interesan.
  GoRoute(
    path: '/',
    redirect: (_, __) => '/home/0',
  )
]);
