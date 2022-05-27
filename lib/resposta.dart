/*
Criar componente Stateless
Criar construtor que irá receber um texto, que será o valor que será colocado no botão
*/

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.purple.shade700,
        ),
        child: Text(
          texto,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: quandoSelecionado,
      ),
    );
  }
}
