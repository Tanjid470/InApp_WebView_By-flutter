import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DataFetchController {

   Map<String, String> headerData = {
    'accept': '/',
    'X-API-KEY': '737f8408-a604-4c6a-b251-21ba9797b379',
  };

  Future<String?> curlData() async{
     try {
      String url = "https://exuat.bracsaajanexchange.com/api/v1/GBG/getidscanurl?customerId=22";
      Response? response = await http.get(Uri.parse(url), headers: headerData);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data['scanUrl'];
      }
      else {
          return null;
      }
    } catch (error) {  
      log("--------------------------------$error");
      return null;
    }
  }
}