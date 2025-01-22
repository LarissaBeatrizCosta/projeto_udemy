import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:udemy_curso_app/models/products_model.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _priceController = TextEditingController();

class RegisterProductForm extends StatelessWidget {
  RegisterProductForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: TextFormStyle(formKey: _formKey),
        ),
      ),
    );
  }
}

class TextFormStyle extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const TextFormStyle({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: _nameController,
          decoration: InputDecoration(
            labelText: 'Nome do Produto',
            labelStyle: const TextStyle(color: Colors.orange),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.orange, width: 2),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Preencha o nome do produto";
            } else {
              return null;
            }
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: _priceController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Valor (R\$)',
            labelStyle: const TextStyle(color: Colors.orange),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.orange, width: 2),
            ),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r"^\d{1,4}(\.\d{0,2})?")),
          ],
          validator: (value) {
            if (value == null || value.isEmpty) {
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
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              ProductsModel newProduct = ProductsModel(
                  id: uuid.v4(),
                  name: _nameController.text,
                  price: double.tryParse(_priceController.text) ?? 0);
              await FirebaseFirestore.instance
                  .collection('products')
                  .doc(newProduct.id)
                  .set(newProduct.toMapProducts());
            } else {
              Exception('Formulário preenchido incorretamente');
            }
          },
          child: const Text(
            'Cadastrar Produto',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
