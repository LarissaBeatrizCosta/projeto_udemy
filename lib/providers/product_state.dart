import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:udemy_curso_app/models/products_model.dart';

class ProductState extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;

  //Inicializa a lista
  ProductState() {
    _initState();
  }

  //Chama a função do fire de pegar produtos
  void _initState() async {
    await getProducts();
    notifyListeners();
  }

  //Lista de produtos
  List<ProductsModel> productsList = [];

  //Crregamento
  bool isLoading = false;

//Método que recupera os produtos do firebase
  Future<void> getProducts() async {
    try {
      isLoading = true;
      QuerySnapshot snapshot = await db.collection('products').get();

      productsList
        ..clear()
        ..addAll(
          snapshot.docs.map(
            (doc) {
              final data = doc.data() as Map<String, dynamic>;
              return ProductsModel.fromJsonProducts(data);
            },
          ),
        );
      notifyListeners();
    } catch (e) {
      notifyListeners();
    } finally {
      isLoading = false;
    }
  }

  //Método que add no banco de produtos
  Future<void> insertProduct(
      String productId, Map<String, dynamic> mapProduct) async {
    await db.collection('products').doc(productId).set(mapProduct);
    notifyListeners();
  }

  //Método que deleta do firestore
  Future<void> deleteProduct(String productId) async {
    await db.collection('products')
        .doc(productId)
        .delete();
    productsList.removeWhere((product) => product.id == productId);
    notifyListeners();
  }

  //Método que atualiza
  Future<void> updateProduct(
      String name, double price, String productId) async {
    await db.collection('products')
        .doc(productId)
        .update({
      'name': name,
      'price': price,
    });
    notifyListeners();
  }
}
