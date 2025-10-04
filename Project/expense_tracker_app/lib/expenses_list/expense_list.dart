
import 'package:expense_tracker_app/expenses_list/expense_item.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenseList, required this.onRemoveExpense});

  final List<Expense> expenseList;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenseList[index]),
          background: Container(
            color: Theme.of(context).colorScheme.error.withAlpha(175),
            margin: EdgeInsets.symmetric(
              // Using theme data in widgets
              horizontal: Theme.of(context).cardTheme.margin!.horizontal,
              vertical: Theme.of(context).cardTheme.margin!.vertical
            ),
          ),
          onDismissed: (direction) {
            onRemoveExpense(expenseList[index]);
          },
          child: ExpenseItem(expenseList[index])),
    );
  }
}
