import 'package:flutter/material.dart';
import 'package:ilabtest/model/currency_model.dart';

import 'package:ilabtest/repository/currency_repo.dart';

class CurrenryViewModel with ChangeNotifier {
  List<CurrencyModel> allCurrencies = [];
  List<CurrencyModel> allTargetCurrencies = [];
  String baseCurrencyCode = 'USD';
  double baseAmount = 1.0;

  final CurrencyRepo _currencyRepo = CurrencyRepo();

  Future<void> getAllCurrencies() async {
    allCurrencies = await _currencyRepo.getAllCurrencies();
    notifyListeners();
  }

  Future<void> addCurrency(CurrencyModel currency) async {
    await _currencyRepo.addCurrencies(currency);
    notifyListeners();
  }

  Future<void> deleteTargetCurrency(String currencyCode) async {
    await _currencyRepo.deleteTargetCurrency(currencyCode);
    await getTargetCurrenciesRecords();
    notifyListeners();
  }

  Future<void> getTargetCurrenciesRecords() async {
    String currencies = '';
    final currenciesList = await _currencyRepo.getTargetCurrencies();

    if (currenciesList.isEmpty) {
      allTargetCurrencies = [];
      notifyListeners();
      return;
    }

    for (var i = 0; i < currenciesList.length; i++) {
      currencies += currenciesList[i].code;
      if (i < currenciesList.length - 1) currencies += ',';
    }

    final ratioList = await _currencyRepo.getCurrenciesRatioWithBaseCurrency(
        currencies, baseCurrencyCode);
    allTargetCurrencies = ratioList;
    notifyListeners();
  }

  Future<void> setBaseCurrencyCode(String code) async {
    baseCurrencyCode = code;
    notifyListeners();
  }

  Future<void> setBaseAmount(double amount) async {
    baseAmount = amount;
    notifyListeners();
  }
}
