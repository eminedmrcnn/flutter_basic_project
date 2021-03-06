import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_basics_project/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transactions,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transactions;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text('\$${widget.transactions.amount}')),
          ),
        ),
        title: Text(
          widget.transactions.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transactions.date),
        ),
        trailing: MediaQuery.of(context).size.width > 360 
        ? FlatButton.icon(
          icon: Icon(Icons.delete), 
          label: Text('Delete'),
          textColor: Theme.of(context).errorColor,
          onPressed: () => widget.deleteTx(widget.transactions.id),
          ) 
          : IconButton(icon: Icon(Icons.delete),
        color: Theme.of(context).errorColor,
        onPressed: () => widget.deleteTx(widget.transactions.id),
        ),
      ),
    );
  }
}
