import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:udemy_curso_app/providers/product_state.dart';
import '../models/products_model.dart';
import '../utils/helpers/circular_progress.dart';
import '../utils/helpers/snackbar.dart';
import '../utils/home/drawer_home.dart';

final TextEditingController _nameController = TextEditingController();
final TextEditingController _priceController = TextEditingController();

class ProductsView extends StatelessWidget {
  ProductsView({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductState(),
        ),
        ChangeNotifierProvider(
          create: (context) => SnackBarHelp(),
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
        body: Consumer2<ProductState, SnackBarHelp>(
          builder: (BuildContext context, stateProduct, stateSnack, _) {
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
                            showModalBottomSheet(
                              context: context,
                              isDismissible: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              builder: ((context) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    top: 30,
                                    left: 20,
                                    right: 20,
                                    bottom: 20,
                                  ),
                                  height: 500,
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Editar Produto',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(height: 30),
                                        TextFormField(
                                          controller: _nameController,
                                          decoration: InputDecoration(
                                            labelText: 'Nome do Produto',
                                            labelStyle: const TextStyle(
                                                color: Colors.orange),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.orange,
                                                  width: 2),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Preencha o nome do produto";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                        SizedBox(height: 20),
                                        TextFormField(
                                          controller: _priceController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            labelText: 'Valor (R\$)',
                                            labelStyle: const TextStyle(
                                                color: Colors.orange),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.orange,
                                                  width: 2),
                                            ),
                                          ),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(
                                                    r"^\d{1,4}(\.\d{0,2})?")),
                                          ],
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Preencha o valor";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                        const SizedBox(height: 30),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 20),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          onPressed: () async {
                                            if (formKey.currentState!
                                                .validate()) {
                                              ProductsModel newProduct =
                                                  ProductsModel(
                                                      id: product.id,
                                                      name:
                                                          _nameController.text,
                                                      price: double.tryParse(
                                                              _priceController
                                                                  .text) ??
                                                          0);
                                              await stateProduct.updateProduct(
                                                  newProduct.name,
                                                  newProduct.price,
                                                  product.id);

                                              await stateSnack
                                                  .sucess('Produto editado');
                                              _nameController.clear();
                                              _priceController.clear();

                                              Navigator.pushReplacementNamed(
                                                  context, 'products'); //Gambiarra
                                            } else {
                                              await stateSnack.error(
                                                  'Formulário preenchido incorretamente');
                                            }
                                          },
                                          child: const Text(
                                            'Confirmar',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            );
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
