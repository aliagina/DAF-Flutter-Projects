import 'package:bitcoin/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String SelectedCurrency = 'USD';
  String BTCSelectedCoins = '47,971.50 USD';
  String ETHSelectedCoins = '3,567.76 USD';
  String LTCSelectedCoins = '186.67 USD';
  String SelectedCoins = '';

  DropdownButton<String> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
        value: SelectedCurrency,
        items: dropdownItems,
        onChanged: (value) {
          setState(() {
            BTCSelectedCoins = BCoins(value.toString());
            ETHSelectedCoins = ECoins(value.toString());
            LTCSelectedCoins = LCoins(value.toString());
            SelectedCurrency = value.toString();
          });
        });
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  String BCoins(String val) {
    return Bcoins[val].toString();
  }

  String ECoins(String val) {
    return Ecoins[val].toString();
  }

  String LCoins(String val) {
    return Lcoins[val].toString();
  }

  Padding design(int num) {
    String coins = cryptoList[num];
    if (num == 0) {
      SelectedCoins = BTCSelectedCoins;
    }
    if (num == 1) {
      SelectedCoins = ETHSelectedCoins;
    } else if (num == 2) {
      SelectedCoins = LTCSelectedCoins;
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 3.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 28.0),
          child: Text(
            '1 $coins = $SelectedCoins ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('🤑 Coin Ticker'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            design(0),
            design(1),
            design(2),
            SizedBox(height: 305),
            Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: getDropdownItems(),
            ),
          ],
        ),
      ),
    );
  }
}
