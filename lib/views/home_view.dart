import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        child: SizedBox(
          height: 200,
          child: CarouselView(
            itemExtent: MediaQuery.sizeOf(context).width - 32,
            itemSnapping: true,
            padding: EdgeInsets.all(4),
            children: List.generate(
              4,
              (int index) {
                return Container(
                  color: Colors.amber,
                  child: Image.asset(
                    "assets/images/propaganda${index + 1}.png",
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
