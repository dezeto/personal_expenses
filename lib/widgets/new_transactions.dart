import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addFunction;

  NewTransaction(this.addFunction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text.trim();
    final enteredAmount = double.parse(amountController.text.trim());

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addFunction(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
