import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductState extends ChangeNotifier {

  //Método que add no banco de produtos
  Future<void> insertProduct(String productId,
      Map<String, dynamic> mapProduct) async {
    FirebaseFirestore.instance
        .collection('products')
        .doc(productId)
        .set(mapProduct);
    notifyListeners();
  }
}


Future<void> getProducts() async{

}

