import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      "texto": "Qual a sua cor favorita ?",
      "respostas": [
        {"texto": "Azul", "pontuacao": 5},
        {"texto": "Branco", "pontuacao": 10},
        {"texto": "Amarelo", "pontuacao": 3},
        {"texto": "Preto", "pontuacao": 1},
      ],
    },
    {
      "texto": "Qual é o seu animal favorito ?",
      "respostas": [
        {"texto": "Cachorro", "pontuacao": 10},
        {"texto": "Gato", "pontuacao": 5},
        {"texto": "Peixe", "pontuacao": 3},
        {"texto": "Urso", "pontuacao": 1},
      ],
    },
    {
      "texto": "Qual é o seu anime favorito ?",
      "respostas": [
        {"texto": "Naruto", "pontuacao": 5},
        {"texto": "One Piece", "pontuacao": 10},
        {"texto": "Hunter x Hunter", "pontuacao": 3},
        {"texto": "Evangelion", "pontuacao": 1},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
          backgroundColor: Colors.amber,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
