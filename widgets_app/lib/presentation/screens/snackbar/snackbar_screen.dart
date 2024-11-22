import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Hola mundo!'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 1),
    ));
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, //Evita que se cierre el dialogo sin pulsar una accion.
      builder: (context) =>  AlertDialog(
        title: const Text('Estás seguro?'),
        content: const Text(
            'Non Lorem voluptate dolor occaecat eu occaecat. Voluptate veniam excepteur magna ea amet velit proident. Qui ut ea consectetur magna amet in ut eu aliquip.'),
        actions: [TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')), FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))],
      ),
    ); // Builder es algo que se construye en tiempo de ejecucion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Esse mollit sunt dolore est ullamco. Magna aute reprehenderit anim est proident incididunt aute nisi aliqua elit fugiat mollit fugiat. Sint incididunt labore laborum magna officia culpa proident non occaecat officia. Mollit proident est magna eu labore elit. Ut anim culpa amet excepteur aute veniam irure sunt fugiat minim. Magna irure Lorem adipisicing non. Ut irure ipsum consectetur duis non exercitation aliqua mollit voluptate adipisicing non. Laborum ex magna tempor pariatur. Anim pariatur laboris ipsum ea.')
                  ]);
                  //showLicensePage(context: context);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar diálogo')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () =>
            showCustomSnackbar(context), //El onpressed no tiene argumentos
      ),
    );
  }
}
