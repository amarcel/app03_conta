import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: TelaConta()));
} // fim main

class TelaConta extends StatefulWidget {
  const TelaConta({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CalcContaEstado();
  }
} // fim TelaConta

class _CalcContaEstado extends State<TelaConta> {
  final _formCalc = GlobalKey<FormState>();
  double _valor = 0.0, _porcentagem = 0.0;
  var _valorTotal;

  void _calcTotal() {
    setState(() {
      _valorTotal = _valor * (100 + _porcentagem) / 100;
    });
  } // fim _calcTotal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conta'),
      ),
      body: Form(
        key: _formCalc,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(hintText: 'Valor da conta'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Erro! Informe um valor';
                } else {
                  _valor = double.parse(value);
                  if (_valor <= 0) {
                    return "Erro! O valor deve ser maior que zero";
                  }
                }
                return null;
              }, // fim do validador
            ),
            TextFormField(
              decoration:
                  const InputDecoration(hintText: 'Valor da porcentagem'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Erro! Informe um valor';
                } else {
                  _porcentagem = double.parse(value);
                  if (_porcentagem < 0 || _porcentagem > 100) {
                    return "Erro! O valor deve ser entre 0 e 100";
                  }
                }
                return null;
              }, // fim do validador
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formCalc.currentState!.validate()) {
                    _calcTotal();
                  }
                },
                child: const Text('Calcular com 10%')),
            Text(
              'Valor total R\$ $_valorTotal',
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  } // fim build

} // fim _CalcContaEstado
