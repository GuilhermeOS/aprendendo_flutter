import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return "Boa mané";
    } else if (pontuacao < 12) {
      return "Você é bom msm mané";
    } else if (pontuacao < 16) {
      return "Carrai mané, brabão mermo";
    } else {
      return "Pica";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
            onPressed: quandoReiniciarQuestionario,
            child: const Text(
              "Reiniciar",
              style: TextStyle(fontSize: 18, color: Colors.amber),
            ),
            style: TextButton.styleFrom(backgroundColor: Colors.white)),
      ],
    );
  }
}
