import 'package:animalitos_ui/themes/theme.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const Sidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.home, 'label': 'Inicio', 'permission': 'HOME_VIEW'},
      {'icon': Icons.inventory, 'label': 'Inventario', 'permission': 'INVENTORY_VIEW'},
      {'icon': Icons.bar_chart, 'label': 'Ventas', 'permission': 'SALES_VIEW'},
      {'icon': Icons.people, 'label': 'Clientes', 'permission': 'CUSTOMERS_VIEW'},
      {'icon': Icons.local_shipping, 'label': 'Proveedores', 'permission': 'VENDOR_VIEW'},
      {'icon': Icons.insert_chart, 'label': 'Estadísticas', 'permission': 'STATISTICS_VIEW'},
      {'icon': Icons.admin_panel_settings, 'label': 'Administrador', 'permission': 'ADMINISTRATOR_VIEW'},
    ];

    return Container(
      width: 220,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 40),
          // Avatar y usuario
          const CircleAvatar(radius: 30, backgroundColor: Colors.grey),
          const SizedBox(height: 8),
          const Text('Username', style: TextStyle(fontWeight: FontWeight.bold)),
          const Text('User rol', style: TextStyle(color: Colors.grey)),

          const SizedBox(height: 20),
          // Menú principal
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final selected = index == selectedIndex;
                return InkWell(
                  onTap: () => onItemSelected(index),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: selected ? AppTheme.primaryColor : Colors.transparent,
                          width: 4,
                        ),
                      ),
                    ),
                    child: ListTile(
                      leading: Icon(item['icon'] as IconData,
                          color: selected ? AppTheme.primaryColor : Colors.black),
                      title: Text(item['label'] as String,
                          style: TextStyle(
                              color: selected ? AppTheme.primaryColor : Colors.black)),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          // Ajustes y Cerrar sesión
          ListTile(
            leading: const Icon(Icons.settings, size: 20),
            title: const Text('Ajustes', style: TextStyle(fontSize: 14)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout, size: 20),
            title: const Text('Cerrar sesión', style: TextStyle(fontSize: 14)),
            onTap: () {},
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
