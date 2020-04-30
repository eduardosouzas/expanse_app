import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
   final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo tenis de corrida',
        value: 310.75,
        date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Conta de Luz', value: 211.25, date: DateTime.now()),
  ];

  _addTransactiion(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
      );

      setState(() {
        _transactions.add(newTransaction);
      });
  }  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(transactions: _transactions,),
        TransactionForm(_addTransactiion),
      ],
    );
  }
}