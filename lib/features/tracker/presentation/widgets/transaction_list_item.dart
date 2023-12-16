import 'package:expense_tracker/shared/color/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class TransactionListItem extends StatelessWidget {
  final String category;
  final String description;
  final String amount;

  const TransactionListItem({super.key, required this.category, required this.description, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8.0),
      child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16 * .75),
                )
              ],
            ),
            Text(amount, style: const TextStyle(color: CustomColorScheme.myError),)
          ]),
    );
  }
}
