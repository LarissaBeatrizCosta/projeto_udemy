import 'package:flutter/material.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            duration: Duration(milliseconds: 1),
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
            ),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTileColum(),
        ],
      ),
    );
  }
}

class ListTileColum extends StatelessWidget {
  const ListTileColum({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/home');
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Cadastrar Produtos'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/register_product');
          },
        ),
        ListTile(
          leading: const Icon(Icons.shopping_bag),
          title: const Text('Produtos'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/products');

          },
        ),
      ],
    );
  }
}