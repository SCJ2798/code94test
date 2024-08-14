import 'package:flutter/material.dart';
import 'package:ilabtest/view/pages/add_target_currency_page.dart';
import 'package:ilabtest/view/components/target_currency_view.dart';
import 'package:ilabtest/view_model/currency_view_model.dart';
import 'package:provider/provider.dart';

class ExchangeViewPage extends StatefulWidget {
  const ExchangeViewPage({super.key});

  @override
  State<ExchangeViewPage> createState() => _ExchangeViewPageState();
}

class _ExchangeViewPageState extends State<ExchangeViewPage> {
  bool isPasswordNotShow = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      Provider.of<CurrenryViewModel>(context, listen: false).getAllCurrencies();
      Provider.of<CurrenryViewModel>(context, listen: false)
          .getTargetCurrenciesRecords();
    });
  }

  Future<void> _onPressFloatingButton() async {
    try {
      await Provider.of<CurrenryViewModel>(context, listen: false)
          .getAllCurrencies();

      await Future.delayed(const Duration(milliseconds: 100));
      if (!mounted) return;

      await showModalBottomSheet(
          context: context,
          builder: (context) => const AddTargetCurrencyViewPage(),
          useSafeArea: true);

      await Future.delayed(const Duration(milliseconds: 100));
      if (!mounted) return;

      await Provider.of<CurrenryViewModel>(context, listen: false)
          .getTargetCurrenciesRecords();
    } catch (e) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Something went Wrong")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Advanced Exchanger"),
      ),
      body: Consumer<CurrenryViewModel>(builder: (context, currencyVM, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              //

              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "INSERT AMOUNT",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),

              // Insert Base Amount & Select Base Currency
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Insert Amount Field
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      initialValue: "1.0",
                      focusNode: FocusNode(),
                      style: Theme.of(context).textTheme.titleLarge,
                      keyboardType: TextInputType.number,
                      onChanged: (value) async {
                        await Provider.of<CurrenryViewModel>(context,
                                listen: false)
                            .setBaseAmount(double.tryParse(value) ?? 1.0);
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                  // Select Base Currency
                  Expanded(
                    flex: 2,
                    child: DropdownButtonFormField(
                      elevation: 0,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      style: Theme.of(context).textTheme.labelLarge,
                      value: currencyVM.baseCurrencyCode,
                      dropdownColor: Colors.black,
                      items: currencyVM.allCurrencies
                          .map((e) => DropdownMenuItem(
                                value: e.code,
                                child: Text(e.code),
                              ))
                          .toList(),
                      onChanged: (value) {
                        Provider.of<CurrenryViewModel>(context, listen: false)
                            .setBaseCurrencyCode(value!);
                        Provider.of<CurrenryViewModel>(context, listen: false)
                            .getTargetCurrenciesRecords();
                      },
                    ),
                  ),
                ],
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "CONVERT TO",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),

              // View target currencies list
              Expanded(
                flex: 1,
                child: currencyVM.allTargetCurrencies.isEmpty
                    ? Center(
                        child: Text(
                          "No Records Found",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )
                    : ListView.separated(
                        itemCount: currencyVM.allTargetCurrencies.length,
                        itemBuilder: (context, index) =>
                            TargetCurrencyListTileView(
                                currencyModel:
                                    currencyVM.allTargetCurrencies[index],
                                baseAmount: currencyVM.baseAmount),
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: 8),
                      ),
              ),
              // Form
            ],
          )),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressFloatingButton,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
