import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet !',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    'assets/images/loading.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          )),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactions[index].title,
                              style: Theme.of(context).textTheme.title,
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              DateFormat.yMMMd()
                                  .format(transactions[index].date),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
              // children: transactions
              //     .map(
              //       (e) =>
              //     )
              //     .toList(),
            ),
    );
  }
}
