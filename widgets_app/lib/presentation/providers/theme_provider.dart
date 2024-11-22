import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Estado dark mode (booleano)

final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Listado de colores inmutable
//Esto no se va a cambiar solo va a leerse
final colorListProvider = Provider((ref) => colorList);

//Provider para determinar color seleccionado
final selectedColorProvider = StateProvider<int>((ref) => 0);

//Objeto de tipo AppTheme (personalizado)
//Controlador     Estado que maneja
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

//Controlar el tema => Controller o Notifier
//Maneja una instancia de una clase...
class ThemeNotifier extends StateNotifier<AppTheme> {
  //State = Estado = new AppTheme();
  //Necesito que se cree la primera instancia de mi AppTheme, con sus valores por defecto.
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeSelectedColor(int value) {
    state = state.copyWith(selectedColor: value);
  }
}


//Provider o StateProvider Riverpod va a manejar el controlador de la variable a cambiar, riverpod automaticamente crea el notifier.

//StateNotifierProvider da la libertad de establecer el notifier