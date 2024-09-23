import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepositoryImpl(videosDatasource: LocalVideoDataSource()
    );

    return MultiProvider(
      providers: [
        //los providers son lazy por defecto.
        ChangeNotifierProvider(
            //lazy: false, Si es lazy, Cuando se obtenga la primera referencia al provider, la va a crear. Si no es lazy,se creara inmediatamente.
            create: (_) => DiscoverProvider(videosRepository: videoPostRepository)
              ..loadNextPage()) //Operador de cascada que vuelve a apuntar al objeto raiz para no hacer llamada de metodos object.method() object.method2()
      ], //Al hacer esto se hace accesible a toda la app el provider.
      child: MaterialApp(
        title: 'Toktik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
