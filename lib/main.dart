import 'package:flutter/material.dart';
import 'package:pratica_1/opcao.dart';
import 'package:pratica_1/pergunta.dart';
import 'package:pratica_1/resultado.dart';

main(List<String> args) {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntas = [
    {
      'texto': 'Pergunta 1?',
      'opcoes': [
        {'texto': 'Opção 1', 'pontuacao': 10},
        {'texto': 'Opção 2', 'pontuacao': 5},
        {'texto': 'Opção 3', 'pontuacao': 3},
        {'texto': 'Opção 4', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Pergunta 2?',
      'opcoes': [
        {'texto': 'Opção A', 'pontuacao': 10},
        {'texto': 'Opção B', 'pontuacao': 5},
        {'texto': 'Opção C', 'pontuacao': 3},
        {'texto': 'Opção D', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Pergunta 3?',
      'opcoes': [
        {'texto': 'Opção I', 'pontuacao': 10},
        {'texto': 'Opção II', 'pontuacao': 5},
        {'texto': 'Opção III', 'pontuacao': 3},
        {'texto': 'Opção IV', 'pontuacao': 1},
      ]
    },
  ];

  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> _opcoes = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['opcoes']
        : null;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pergunta(
                    perguntaSelecionada: _perguntaSelecionada,
                    perguntas: _perguntas,
                  ),
                  ..._opcoes.map((e) => Opcao(
                        onSelection: () => _responder(e['pontuacao']),
                        opcao: e['texto'],
                      )),
                ],
              )
            : Resultado(reiniciar, _pontuacaoTotal),
      ),
    );
  }
}
