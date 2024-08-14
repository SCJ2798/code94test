import 'package:flutter/material.dart';
import 'package:ilabtest/model/currency_model.dart';
import 'package:ilabtest/utill/style/button_style.dart';
import 'package:ilabtest/utill/style/text_input_borders.dart';
import 'package:ilabtest/view_model/currency_view_model.dart';
import 'package:provider/provider.dart';

class AddTargetCurrencyViewPage extends StatefulWidget {
  const AddTargetCurrencyViewPage({super.key});

  @override
  State<AddTargetCurrencyViewPage> createState() =>
      _AddTargetCurrencyViewPageState();
}

class _AddTargetCurrencyViewPageState extends State<AddTargetCurrencyViewPage> {
  bool isPasswordNotShow = true;

  String _selectedCurrencyCode = 'USD';

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrenryViewModel>(
      builder: (context, currencyVM, child) {
        // print(currencyVM.allCurrencies);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: const Text("Add Currency",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: DropdownButtonFormField(
                  value: _selectedCurrencyCode,
                  decoration:
                      const TextInputDecoration.common("Select Currency"),
                  items: currencyVM.allCurrencies
                      .map((e) => DropdownMenuItem(
                            value: e.code,
                            child: Text(e.code),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value == null) return;
                      _selectedCurrencyCode = value;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Cancel text button
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    // Save button
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            await Provider.of<CurrenryViewModel>(context,
                                    listen: false)
                                .addCurrency(CurrencyModel(
                                    code: _selectedCurrencyCode, value: 0.0));

                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          } catch (e) {
                            await Future.delayed(
                                const Duration(milliseconds: 100));
                            if (!mounted) return;

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Something went Wrong")));
                          }
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Form
            ],
          ),
        );
      },
    );
  }
}
