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
                          onPressed: () async {

                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            stateProduct.deleteProduct(product.id);
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

// void _showEditDialog(BuildContext context, ProductsModel product,
//     ProductState stateProductModal) {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Editar Produto'),
//         content: SingleChildScrollView(
//           child: Form(
//             key: formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextFormField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     labelText: 'Nome do Produto',
//                     labelStyle: const TextStyle(color: Colors.orange),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           const BorderSide(color: Colors.orange, width: 2),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Preencha o nome do produto";
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16), // Espaço entre os campos
//                 TextFormField(
//                   controller: priceController,
//                   decoration: InputDecoration(
//                     labelText: 'Preço do Produto',
//                     labelStyle: const TextStyle(color: Colors.orange),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           const BorderSide(color: Colors.orange, width: 2),
//                     ),
//                   ),
//                   keyboardType: TextInputType.number,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Preencha o preço do produto";
//                     }
//                     return null;
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               if (formKey.currentState!.validate()) {
//                 stateProductModal.updateProduct(
//                     product.name, product.price, product.id);
//                 print(
//                     'MODAL AQUI ${product.name}-${product.price}-${product.id}');
//                 Navigator.pushReplacementNamed(context, '/home');
//               }
//             },
//             child: Text('Salvar'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('Cancelar'),
//           ),
//         ],
//       );
//     },
//   );
// }
