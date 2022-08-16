import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transcation.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(
      {Key key, @required this.transactions, @required this.deleteTx})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 300,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  children: [
                    Text(
                      'No Data is present',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        )),
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    subtitle: Text(DateFormat('dd MMM yy hh:mm a')
                        .format(transactions[index].date)),
                    trailing: (MediaQuery.of(context).size.width > 400)
                        ? FlatButton.icon(
                            onPressed: () => deleteTx(transactions[index].id),
                            textColor: Colors.red,
                            icon: const Icon(
                              Icons.delete,
                              size: 40,
                              color: Colors.red,
                            ),
                            label: const Text(
                              'Delete',
                            ),
                          )
                        : IconButton(
                            onPressed: () => deleteTx(transactions[index].id),
                            icon: const Icon(
                              Icons.delete,
                              size: 40,
                              color: Colors.red,
                            )),
                  ),
                );
              },
            ),
    );
  }
}
