import 'package:ilabtest/data/local/base_db_service.dart';
import 'package:ilabtest/data/local/currency_local_data_service.dart';
import 'package:ilabtest/data/remote/base_api_service.dart';
import 'package:ilabtest/data/remote/currency_remote_data_service.dart';
import 'package:ilabtest/model/currency_model.dart';

class CurrencyRepo {
  final BaseApiService _apiService = CurrencyRemoteDataService();
  final BaseDbService _localDbService = CurrencyLocalDataService();

  Future<List<CurrencyModel>> getAllCurrencies() async {
    dynamic response = await _apiService.getResponse("");
    var keys = (response['data'] as Map).keys.toList();
    return keys
        .map((e) =>
            CurrencyModel.fromJson({'code': e, 'value': response['data'][e]}))
        .toList();
  }

  Future<void> addCurrencies(CurrencyModel currency) async {
    await _localDbService.addData(currency);
  }

  Future<List<CurrencyModel>> getCurrenciesRatioWithBaseCurrency(
      String currencies, String baseCurrency) async {
    dynamic response = await _apiService.getResponseWithQuery(
        {'currencies': currencies, "base_currency": baseCurrency});

    var keys = (response['data'] as Map).keys.toList();
    return keys
        .map((e) =>
            CurrencyModel.fromJson({'code': e, 'value': response['data'][e]}))
        .toList();
  }

  Future<List<CurrencyModel>> getTargetCurrencies() async {
    try {
      return await _localDbService.fetchAllData() as List<CurrencyModel>;
    } catch (e) {
      return [];
    }
  }

  Future<void> deleteTargetCurrency(String currencyCode) async {
    await _localDbService.deleteData(currencyCode);
  }
}
