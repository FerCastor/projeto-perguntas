import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario, {Key? key})
      : super(key: key);

  String? get fraseResultado {
    if (pontuacao <= 5) {
      return 'Acertou $pontuacao perguntas!\n Tente novamente!';
    } else if (pontuacao <= 9) {
      return 'É... dá pro gasto! \nAcertou $pontuacao!';
    } else if (pontuacao == 10) {
      return 'Acertou TODAS! \nCê é fodão mesmo hein!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado!,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          child: const Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
