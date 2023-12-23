import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'networking.dart';
import 'dart:convert';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String shownTextForButton1 = '1 BTC = ? ' + currenciesList[4];
  String shownTextForButton2 = '1 ETH = ? ' + currenciesList[4];
  String shownTextForButton3 = '1 LTC = ? ' + currenciesList[4];
  String selectedCurrency = currenciesList[4];
  int currencyValue;
  List<Center> getCupertinoPickerItems() {
    List<Center> cupertinoPickerItems = [];
    for (String currency in currenciesList) {
      var newItem = Center(
          child: Text(
        currency,
        style: TextStyle(
          color: Colors.white,
        ),
      ));
      cupertinoPickerItems.add(newItem);
    }
    return cupertinoPickerItems;
  }

  Future<int> extractPrice(String currency) async {
    TickBitCoin ticker = TickBitCoin();
    Map response = jsonDecode(await ticker.getPrice(currency));
    return response['last'].round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 28.0),
                    child: TextButton(
                      onPressed: () async {
                        currencyValue =
                            await extractPrice('BTC' + selectedCurrency);
                        setState(() {
                          shownTextForButton1 = '1 BTC = ' +
                              currencyValue.toString() +
                              ' ' +
                              selectedCurrency;
                        });
                      },
                      child: Text(
                        shownTextForButton1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 28.0),
                    child: TextButton(
                      onPressed: () async {
                        currencyValue =
                            await extractPrice('ETH' + selectedCurrency);
                        setState(() {
                          shownTextForButton2 = '1 ETH = ' +
                              currencyValue.toString() +
                              ' ' +
                              selectedCurrency;
                        });
                      },
                      child: Text(
                        shownTextForButton2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 28.0),
                    child: TextButton(
                      onPressed: () async {
                        currencyValue =
                            await extractPrice('LTC' + selectedCurrency);
                        setState(() {
                          shownTextForButton3 = '1 LTC = ' +
                              currencyValue.toString() +
                              ' ' +
                              selectedCurrency;
                        });
                      },
                      child: Text(
                        shownTextForButton3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: Colors.lightBlue,
            height: 120.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 10.0),
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(initialItem: 4),
              itemExtent: 31.0,
              onSelectedItemChanged: (int selectedIndex) {
                setState(() {
                  shownTextForButton1 =
                      '1 BTC = ? ' + currenciesList[selectedIndex];
                  shownTextForButton2 =
                      '1 ETH = ? ' + currenciesList[selectedIndex];
                  shownTextForButton3 =
                      '1 LTC = ? ' + currenciesList[selectedIndex];
                  selectedCurrency = currenciesList[selectedIndex];
                });
              },
              children: getCupertinoPickerItems(),
            ),
          ),
        ],
      ),
    );
  }
}
