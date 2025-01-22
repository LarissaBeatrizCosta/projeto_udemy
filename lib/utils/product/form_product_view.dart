import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:udemy_curso_app/models/products_model.dart';

final _formKey = GlobalKey<FormState>();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _priceController = TextEditingController();

class RegisterProductForm extends StatelessWidget {
  const RegisterProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: TextFormStyle(),
        ),
      ),
    );
  }
}

class TextFormStyle extends StatelessWidget {
  const TextFormStyle({super.key});

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
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ProductsModel newProduct = ProductsModel(
                  id: 0,
                  name: _nameController.text,
                  price: double.tryParse(_priceController.text) ?? 0);
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
