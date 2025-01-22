import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/product/form_product_view.dart';

class RegisterProduct extends StatelessWidget {
  const RegisterProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RegisterProductForm(),
    );
  }
}
