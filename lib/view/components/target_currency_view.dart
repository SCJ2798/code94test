import 'package:flutter/material.dart';
import 'package:ilabtest/error/comon_error.dart';
import 'package:ilabtest/model/currency_model.dart';
import 'package:ilabtest/utill/constant.dart';
import 'package:ilabtest/view_model/currency_view_model.dart';
import 'package:provider/provider.dart';

class TargetCurrencyListTileView extends StatelessWidget {
  CurrencyModel currencyModel;
  double baseAmount;

  TargetCurrencyListTileView(
      {super.key, required this.currencyModel, required this.baseAmount});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.red,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) async {
        try {
          await Provider.of<CurrenryViewModel>(context, listen: false)
              .deleteTargetCurrency(currencyModel.code);
        } catch (e) {
          await Future.delayed(const Duration(milliseconds: 100));
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Something went Wrong")));
        }
      },
      key: Key("DK_${currencyModel.code}"),
      child: ListTile(
        style: Theme.of(context).listTileTheme.style,
        contentPadding: Theme.of(context).listTileTheme.contentPadding,
        dense: true,
        visualDensity: VisualDensity(horizontal: 0, vertical: 0),
        shape: Theme.of(context).listTileTheme.shape,
        leading: Text(
          (currencyModel.value * baseAmount).toStringAsFixed(3),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        trailing: Text(currencyModel.code,
            style: Theme.of(context).textTheme.labelLarge),
      ),
    );
  }
}
