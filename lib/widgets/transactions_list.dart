import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function _deleteTransaction;

  TransactionList(this._userTransactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return _userTransactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text('No transactions added yet!',
                      style: Theme.of(context).textTheme.title),
                  SizedBox(height: 10),
                  Container(
                    height: constraints.maxHeight * 0.75,
                    child: Image.asset(
                      'assets/img/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: ListTile(
                  leading: Padding(
                    padding: EdgeInsets.all(5),
                    child: FittedBox(
                      child: CircleAvatar(
                        radius: 40,
                        child: Text(
                          '\$${_userTransactions[index].amount.toStringAsFixed(2)}',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    _userTransactions[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(_userTransactions[index].date),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () =>
                        _deleteTransaction(_userTransactions[index].id),
                  ),
                ),
              );
            },
            itemCount: _userTransactions.length,
          );
  }
}
