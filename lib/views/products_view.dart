import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:udemy_curso_app/providers/product_state.dart';
import '../utils/helpers/circular_progress.dart';
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
              return CircularProgress();
            }

            if (stateProduct.productsList.isEmpty) {
              return Center(child: Text("Nenhum produto encontrado."));
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: stateProduct.productsList.length,
              itemBuilder: (context, index) {
                final product = stateProduct.productsList[index];
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  elevation: 4,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    title: Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Preço: R\$ ${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            stateProduct.deleteProduct(product);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
