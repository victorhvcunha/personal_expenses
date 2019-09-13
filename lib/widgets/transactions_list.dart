import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;

  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _userTransactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No transactions added yet!',
                    style: Theme.of(context).textTheme.title),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/img/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, id) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: ListTile(
                    leading: Padding(
                      padding: EdgeInsets.all(5),
                      child: FittedBox(
                        child: CircleAvatar(
                          radius: 40,
                          child: Text(
                              '\$${_userTransactions[id].amount.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      _userTransactions[id].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(_userTransactions[id].date),
                    ),
                  ),
                );
              },
              itemCount: _userTransactions.length,
            ),
    );
  }
}
