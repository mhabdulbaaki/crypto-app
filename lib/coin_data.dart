import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '4F3D4E50-6497-4573-AF14-90FD93A00EA7';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoValues = {};
    for (String crypto in cryptoList) {
      http.Response response = await http
          .get('$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey');
      if (response.statusCode == 200) {
        double decodedData = jsonDecode(response.body)['rate'];
        cryptoValues[crypto] = decodedData.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'request unsuccessful';
      }
    }
    print(cryptoValues['ETH']);
    return cryptoValues;
  }
}
