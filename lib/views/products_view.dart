import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:udemy_curso_app/providers/product_state.dart';
import '../utils/home/drawer_home.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductState(),
        ),
      ],
      child: Scaffold(
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
        body: Consumer<ProductState>(
          builder: (BuildContext context, stateProduct, _) {
            if (stateProduct.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (stateProduct.productsList.isEmpty) {
              return Center(child: Text("Nenhum produto encontrado."));
            }

            return ListView.builder(
              itemCount: stateProduct.productsList.length,
              itemBuilder: (context, index) {
                final product = stateProduct.productsList[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(product.price.toString()),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
