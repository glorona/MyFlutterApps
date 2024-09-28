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
  ];
