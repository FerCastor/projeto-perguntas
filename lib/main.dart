import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual bicho transmite a Doença de Chagas?',
      'respostas': [
        {'texto': 'Abelha', 'pontuacao': 0},
        {'texto': 'Barata', 'pontuacao': 0},
        {'texto': 'Pulga', 'pontuacao': 0},
        {'texto': 'Barbeiro', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual fruto é conhecido no Norte como "jerimum"?',
      'respostas': [
        {'texto': 'Caju', 'pontuacao': 0},
        {'texto': 'Abóbora', 'pontuacao': 1},
        {'texto': 'Chuchu', 'pontuacao': 0},
        {'texto': 'Melancia', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual é o coletivo de cães?',
      'respostas': [
        {'texto': 'Matilha', 'pontuacao': 1},
        {'texto': 'Rebanho', 'pontuacao': 0},
        {'texto': 'Alcateia', 'pontuacao': 0},
        {'texto': 'Manada', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Quem compôs o Hino da Independência?',
      'respostas': [
        {'texto': 'Castro Alvez', 'pontuacao': 0},
        {'texto': 'Manuel Batista', 'pontuacao': 0},
        {'texto': 'Dom Pedro I', 'pontuacao': 1},
        {'texto': 'Carlos Gomes', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual é o triângulo que tem todos os lados diferentes?',
      'respostas': [
        {'texto': 'Equilátero', 'pontuacao': 0},
        {'texto': 'Isósceles', 'pontuacao': 0},
        {'texto': 'Escaleno', 'pontuacao': 1},
        {'texto': 'Trapézio', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual é o antônimo de "malograr"?',
      'respostas': [
        {'texto': 'Conseguir', 'pontuacao': 1},
        {'texto': 'Fracassar', 'pontuacao': 0},
        {'texto': 'Perder', 'pontuacao': 0},
        {'texto': 'Desprezar', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Em que país nasceu Carmem Miranda?',
      'respostas': [
        {'texto': 'Brasil', 'pontuacao': 0},
        {'texto': 'Espanha', 'pontuacao': 0},
        {'texto': 'Argentina', 'pontuacao': 0},
        {'texto': 'Portugal', 'pontuacao': 1},
      ],
    },
    {
      'texto':
          'Qual foi o último Presidente do período da ditadura militar no Brasil?',
      'respostas': [
        {'texto': 'Costa e Silva', 'pontuacao': 0},
        {'texto': 'João Figueiredo', 'pontuacao': 1},
        {'texto': 'Ernesto Geisel', 'pontuacao': 0},
        {'texto': 'Emílio Médici', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Seguindo a sequência do baralho, qual carta vem depois do dez?',
      'respostas': [
        {'texto': 'Rei', 'pontuacao': 0},
        {'texto': 'Valete', 'pontuacao': 1},
        {'texto': 'Nova', 'pontuacao': 0},
        {'texto': 'Ás', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'O termo "venoso" está relacionado a:',
      'respostas': [
        {'texto': 'Vela', 'pontuacao': 0},
        {'texto': 'Vento', 'pontuacao': 0},
        {'texto': 'Vênia', 'pontuacao': 0},
        {'texto': 'Veia', 'pontuacao': 1},
      ],
    },
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

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                fnResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}
