import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final void Function() reiniciar;
  final int pontuacaoTotal;

  Resultado(this.reiniciar, this.pontuacaoTotal);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Parabéns!!!',
            style: TextStyle(fontSize: 28),
          ),
          Text('Pontuação: $pontuacaoTotal'),
          FlatButton(
            onPressed: reiniciar,
            child: Text(
              'Reiniciar?',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
