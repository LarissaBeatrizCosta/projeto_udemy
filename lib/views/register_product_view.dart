import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/product/form_product_view.dart';

class RegisterProductView extends StatelessWidget {
  const RegisterProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "PetShop Tulipa",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ),
        leading: Container(
          margin: EdgeInsets.all(10),
          child: IconButton(
            onPressed: () {
              //todo: opções de navegação
            },
            icon: Icon(
              (Icons.menu_outlined),
              color: Colors.amber,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/profile');
            },
            icon: Icon(
              Icons.account_circle,
              color: Colors.amber,
            ),
          ),
        ],
      ),
      body: RegisterProductForm(),
    );
  }
}
