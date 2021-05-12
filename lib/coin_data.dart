import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
  'DOGE'
];

const coinAPIURL = 'min-api.cryptocompare.com';
const coinAPIURLPart2 = '/data/price';
const apiKey = '1fb1f3cea32c02aa335315625d03fe433667bf9458f2554544bd3bc3977b03ef';

class CoinData {

  CoinData(this.selectedCurrency);

  final selectedCurrency;

  Future<Map> getData(String crpyto) async {
    var url = await Uri.https(coinAPIURL, coinAPIURLPart2,
        {'fsym': crpyto, 'tsyms':selectedCurrency, 'api_key': apiKey});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var jsonResponse = convert.jsonDecode(data);
      return jsonResponse;
    }
  }

}
