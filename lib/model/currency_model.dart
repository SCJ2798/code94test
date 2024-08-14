class CurrencyModel {
  String code;
  double value;

  CurrencyModel({required this.code, required this.value});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
        code: json['code'],
        value: double.tryParse(json['value'].toString()) ?? 0.0);
  }

  Map<String, dynamic> toJson() {
    return {'code': code, 'value': value};
  }
}
