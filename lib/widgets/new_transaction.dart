import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTrans;

  NewTransaction(this.addTrans);

  void addNewTransaction() {
    if (titleController.text.isEmpty ||
        double.parse(amountController.text) <= 0) {
          print('came');
      return;
    }
    addTrans(titleController.text, double.parse(amountController.text));
  }

  //numbwe is not working for ios. Need to use numberWithOptions(decomal:true)
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => addNewTransaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => addNewTransaction(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: addNewTransaction,
            )
          ],
        ),
      ),
    );
  }
}
