import 'package:flutter/material.dart';
import 'card.dart';

class AppBarDesign extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDesign({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: AppBar(
        elevation: 0,
        title: const Text(
          'Lojinha',
          style: TextStyle(color: Colors.black54, fontSize: 25),
        ),
        backgroundColor: Colors.white,
        actions: [CardStore()],
      ),
    );
  }
}
