import 'package:flutter/material.dart'; //show IconData; //Unicamente lo que se necesita del paquete.

class MenuItem {
  final String title;
  final String subtitle;
  final String url;
  final IconData icon;

  const MenuItem({
      required this.title,
      required this.subtitle,
      required this.url,
      required this.icon});
}

const appMenuItems = <MenuItem>[
    MenuItem(
        title: 'Botones',
        subtitle: 'Varios botones en Flutter',
        url: '/buttons',
        icon: Icons.smart_button_outlined),
    MenuItem(
        title: 'Tarjetas',
        subtitle: 'Contenedores estilizados',
        url: '/cards',
        icon: Icons.credit_card),
    MenuItem(
        title: 'Progress Indicators',
        subtitle: 'Generales y controlados',
        url: '/progress',
        icon: Icons.refresh_rounded),
    MenuItem(
        title: 'Snackbars y diálogos',
        subtitle: 'Indicadores en pantalla',
        url: '/snackbars',
        icon: Icons.info_outline),
    MenuItem(
        title: 'Animnated Container',
        subtitle: 'Stateful widget animado',
        url: '/animated',
        icon: Icons.check_box_outline_blank_rounded),
    MenuItem(
        title: 'UI Controls',
        subtitle: 'Controles para UI de flutter',
        url: '/ui-controls',
        icon: Icons.car_rental_outlined),
    MenuItem(
        title: 'Tutorial',
        subtitle: 'Introducción a la aplicación',
        url: '/tutorial',
        icon: Icons.accessibility_new_rounded),
    MenuItem(
        title: 'Infinite scroll',
        subtitle: 'Imagenes infinitas y pull to refresh',
        url: '/infinite',
        icon: Icons.image_rounded),
    MenuItem(
        title: 'Counter Screen',
        subtitle: 'Counter screen con riverpod',
        url: '/counter',
        icon: Icons.plus_one_rounded),
    MenuItem(
        title: 'Cambiar color de tema',
        subtitle: 'Cambia el color del tema',
        url: '/theme',
        icon: Icons.palette_rounded),

  ];
