import 'package:flutter/material.dart';

class RegisterProductForm extends StatelessWidget {
  const RegisterProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Form(
          child: TextFormField(),
        ),
      ),
    );
  }
}
