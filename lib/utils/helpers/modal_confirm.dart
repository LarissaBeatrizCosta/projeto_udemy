import 'package:flutter/material.dart';


//Ver como deixar isso reutilizavel
class ModalConfirm extends StatelessWidget {
  const ModalConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    String title = '';
    String subtitle = '';
    return AlertDialog(
      title: Text(title),
      content: Text(subtitle),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}
