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
        url: '/card',
        icon: Icons.credit_card),   
  ];
