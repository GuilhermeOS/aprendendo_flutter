import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String texto;
  final void Function() onSelection;

  Respostas(this.texto, this.onSelection);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.amber,
          textStyle: const TextStyle(
            color: Colors.black,
          ),
        ),
        onPressed: onSelection,
        child: Text(texto),
      ),
    );
  }
}
