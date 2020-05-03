import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  DateTime _dateSelected = DateTime.now();
  final _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onSubmitForm() {
      final title = _titleController.text;
      final value = double.tryParse(_valueController.text) ?? 0.0;

      if (title.isEmpty || value.isNegative || _dateSelected == null) {
        return;
      }

      widget.onSubmit(title, value, _dateSelected);
    }

    _showDatePicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now(),
      ).then((pickedDate) {
        if (pickedDate == null) {
          return null;
        } else {
          setState(() {
            _dateSelected = pickedDate;
          });
        }
      });
    }

    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              onSubmitted: (_) => _onSubmitForm(),
              decoration: InputDecoration(labelText: "Título"),
            ),
            TextField(
              controller: _valueController,
              onSubmitted: (_) => _onSubmitForm(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: "Valor (R\$)"),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _dateSelected == null
                          ? 'nenhuma data Selecionada!'
                          : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_dateSelected)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _showDatePicker,
                    child: Text(
                      'Selecione data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                    onPressed: _onSubmitForm,
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color,
                    child: Text(
                      "Nova Transação",
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
