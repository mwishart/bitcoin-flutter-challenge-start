import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'coin_data.dart';
import 'price_screen.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}



class _LoadingScreenState extends State<LoadingScreen> {
  String selectedCurrency = 'USD';
  var currency = Map();

  @override
  void initState() {
    super.initState();
    getCoinData();
  }

  Future getCoinData() async{
    CoinData coinData = CoinData(selectedCurrency);
    var coin;
    for(String money in cryptoList){
      coin = await coinData.getData(money);
      currency[money] = coin[selectedCurrency].toDouble();
    }
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return PriceScreen(coinData: currency);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitHourGlass(
          size: 100.0,
          color: Color(0xFF109539),
        )
      ),
    );
  }
}
