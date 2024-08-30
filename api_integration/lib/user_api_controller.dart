import 'dart:convert';

import 'package:api_integration/consts.dart';
import 'package:http/http.dart' as http;

class UserAPiController{
  Future<Map<String,dynamic>> getUserByPage(int page) async{
    try{
      String url = ApiUrls.reqresBaseUrl+"users?page=$page";
      final res = await http.get(Uri.parse(url));
      if(res.statusCode==200){
        return jsonDecode(res.body);
      }
      return {};
    }catch(err){
      return {};
    }
  }
}