import 'package:animalitos_ui/components/sidebar_component.dart';
import 'package:animalitos_ui/providers/authentication_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
  body: Row(
    children: [
      Sidebar(
        selectedIndex: 1,
        onItemSelected: (index) {
          //setState(() => currentPageIndex = index);
        },
      ),
      Expanded(
        child: Container(
          color: Color(0xFFF5F5F5),
          child: Center(child: Text('Hello User!', style: TextStyle(fontSize: 24))),
        ),
      ),
    ],
  ),
);

  }
}
