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
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            Container(
              color: Colors.pink,
              width: 10,
              height: 10,
              child: Center(
                child: Text(
                  "Testando",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.pink,
              width: 10,
              height: 10,
              child: Center(
                child: Text(
                  "Testando",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.pink,
              width: 10,
              height: 10,
              child: Center(
                child: Text(
                  "Testando",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
