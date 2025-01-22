import 'package:flutter/material.dart';

class RegisterProductForm extends StatelessWidget {
  const RegisterProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          child: TextFormStyle(),
        ),
      ),
    );
  }
}


class TextFormStyle extends StatelessWidget{
  const TextFormStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(),
        TextFormField(),
      ],
    );
  }

}

