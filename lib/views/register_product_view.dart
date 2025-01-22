import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/home/drawer_home.dart';
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
      drawer: DrawerHome(),
      body: RegisterProductForm(),
    );
  }
}
