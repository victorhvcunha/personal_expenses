import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  // String titleInput;
  // String amountInput;

  final Function newTransactionHandler;

  NewTransaction(this.newTransactionHandler);

  void submitData() {

    if (titleController.text.isNotEmpty && amountController.text.isNotEmpty)
      newTransactionHandler(
        titleController.text, 
        double.parse(amountController.text)
      );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
              // onChanged: (value) {
              //   amountInput = value;
              // },
            ),
            FlatButton(
              child: Text('Add transaction'),
              onPressed: submitData,
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
