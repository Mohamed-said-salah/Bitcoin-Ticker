import 'package:http/http.dart' as http;
// import 'dart:convert';

const String publicKey = 'NDc5YTFjNmU3OTkxNDg2YmE1YmE5N2M0MzA2NzRlMjE';

class TickBitCoin {
  Future<String> getPrice(currency) async {
    Uri url = Uri.parse(
        'https://apiv2.bitcoinaverage.com/indices/global/ticker/$currency');
    var response = await http.get(url, headers: {'x-ba-key': publicKey});
    return response.body;
  }
}

// void main() async {
//   TickBitCoin ticker = TickBitCoin();
//   var response = jsonDecode(await ticker.getPrice('EUR'));
//   print(await response['last']);
// }

