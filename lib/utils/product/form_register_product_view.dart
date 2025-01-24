import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:udemy_curso_app/models/products_model.dart';
import 'package:udemy_curso_app/controllers/product_state.dart';
import 'package:udemy_curso_app/utils/helpers/snackbar.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _priceController = TextEditingController();

class RegisterProductForm extends StatelessWidget {
  RegisterProductForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SnackBarHelp(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductState(),
        ),
      ],
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: TextFormStyle(formKey: _formKey),
          ),
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
        Consumer2<ProductState, SnackBarHelp>(
          builder: (BuildContext context, stateProduct, stateSnack, _) {
            return ElevatedButton(
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
                  await stateProduct.insertProduct(
                    newProduct.id,
                    newProduct.toMapProducts(),
                  );
                  await stateSnack.sucess('Produto cadastrado.');
                  _nameController.clear();
                  _priceController.clear();
                } else {
                  await stateSnack
                      .error('Formulário preenchido incorretamente');
                }
              },
              child: const Text(
                'Cadastrar produto',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            );
          },
        ),
        SizedBox(height: 15),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/products');
          },
          child: const Text(
            'Ver produtos',
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
