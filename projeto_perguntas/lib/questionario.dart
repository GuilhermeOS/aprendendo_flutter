import 'package:flutter/material.dart';

import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) quandoResponder;

  Questionario(
      {required this.perguntas,
      required this.perguntaSelecionada,
      required this.quandoResponder});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()["respostas"]
        : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]["texto"].toString()),
        ...respostas.map((resp) {
          return Respostas(resp["texto"].toString(),
              () => quandoResponder(int.parse(resp["pontuacao"].toString())));
        }).toList(),
      ],
    );
  }
}
