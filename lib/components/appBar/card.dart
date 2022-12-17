import 'package:flutter/material.dart';

class CardStore extends StatelessWidget {
  const CardStore({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.local_grocery_store_outlined,
        color: Colors.black54,
      ),
      iconSize: 30,
      itemBuilder: (ctx) => [
        const PopupMenuItem(
            child: SizedBox(
          width: 500,
          child: Text('Meu Carrinho de Compras'),
        ))
      ],
    );
  }
}
