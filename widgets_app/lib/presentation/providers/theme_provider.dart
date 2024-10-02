import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Estado dark mode provider

final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Listado de colores inmutable
//Esto no se va a cambiar solo va a leerse
final colorListProvider = Provider((ref) => colorList);

//Provider para determinar color seleccionado
final selectedColorProvider = StateProvider<int>((ref) => 0);
