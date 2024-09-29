import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;

  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(), //Evita movimiento de rebote
      children: [
        SwitchListTile(
            title: const Text('Developer Mode'),
            subtitle: const Text('Controles Adicionales'),
            value: isDeveloper,
            onChanged: (value) => setState(() {
                  isDeveloper = !isDeveloper;
                })),

        ExpansionTile(
          initiallyExpanded: true,
          title: const Text('Vehiculo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
                title: const Text('By Car'),
                subtitle: const Text('Viajar por carro'),
                value: Transportation.car,
                groupValue:
                    selectedTransportation, //valor para marcar la opcion seleccionada
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.car;
                    })),
            RadioListTile(
                title: const Text('By Boat'),
                subtitle: const Text('Viajar por bote'),
                value: Transportation.boat,
                groupValue:
                    selectedTransportation, //valor variable para marcar y actualizar la opcion seleccionada
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.boat;
                    })),
            RadioListTile(
                title: const Text('By Plane'),
                subtitle: const Text('Viajar por avión'),
                value: Transportation.plane,
                groupValue:
                    selectedTransportation, //valor para marcar la opcion seleccionada
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.plane;
                    })),
            RadioListTile(
                title: const Text('By Submarine'),
                subtitle: const Text('Viajar por submarino'),
                value: Transportation.submarine,
                groupValue:
                    selectedTransportation, //valor para marcar la opcion seleccionada
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.submarine;
                    })),
          ],
        ),

        //TODO por aqui

        CheckboxListTile(
            value: wantsBreakfast,
            title: const Text('Desayuno?'),
            onChanged: (value) => setState(() {
              wantsBreakfast = !wantsBreakfast;
            })),

        CheckboxListTile(
            value: wantsLunch,
            title: const Text('Almuerzo?'),
            onChanged: (value) => setState(() {
              wantsLunch = !wantsLunch;
            })),

        CheckboxListTile(
            value: wantsDinner,
            title: const Text('Merienda?'),
            onChanged: (value) => setState(() {
              wantsDinner = !wantsDinner;
            })),
      ],
    );
  }
}
