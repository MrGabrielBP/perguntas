import 'package:flutter/material.dart';

class Opcao extends StatelessWidget {
  final String opcao;
  final void Function() onSelection;

  Opcao({this.opcao, this.onSelection});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: RaisedButton(
        padding: EdgeInsets.all(15),
        textColor: Colors.white,
        color: Colors.blue,
        onPressed: onSelection,
        child: Text(
          opcao,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
