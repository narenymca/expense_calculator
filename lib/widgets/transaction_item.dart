import 'dart:math';

import 'package:expense_tracker/models/transcation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final Transaction transaction;
  final Function deleteTx;
  TransactionItem(
      {Key key, @required this.transaction, @required this.deleteTx})
      : super(key: key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;
  @override
  void initState() {
    const avblColors = [
      Colors.blue,
      Colors.purple,
      Colors.red,
      Colors.black,
    ];
    _bgColor = avblColors[Random().nextInt(4)];
    super.initState();
    print('inside init state');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          //backgroundColor: Colors.amber,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(child: Text('\$${widget.transaction.amount}')),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: Text(
            DateFormat('dd MMM yy hh:mm a').format(widget.transaction.date)),
        trailing: (MediaQuery.of(context).size.width > 400)
            ? FlatButton.icon(
                onPressed: () => widget.deleteTx(widget.transaction.id),
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
                onPressed: () => widget.deleteTx(widget.transaction.id),
                icon: const Icon(
                  Icons.delete,
                  size: 40,
                  color: Colors.red,
                )),
      ),
    );
  }
}
