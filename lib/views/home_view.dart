import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_curso_app/utils/home/carousel_home.dart';
import 'package:udemy_curso_app/utils/home/items_home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<HomeView> {
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
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: CarouselHome(),
            ),
            ItemsHome(),
          ],
        ),
      ),
    );
  }
}
