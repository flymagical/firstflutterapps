import 'dart:convert';

import 'package:flutter_apps/models/model_newsportal.dart';
import 'package:http/http.dart' as http;

class NetworkNewsPortal{
  static String url = "http://newsapi.org/v2/everything?q=covid&from=2020-09-20&sortBy=publishedAt&apiKey=e8c968a6ca2f49d880a81cabbbe70e21";

  Future<ModelNewsPortal> getNewsData() async {
    var responses = await http.get(Uri.encodeFull(url));

    if(responses.statusCode== 200){
      var data = json.decode(responses.body);
      
      ModelNewsPortal modelNewsPortal = ModelNewsPortal.fromJson(data);
      return modelNewsPortal;
    }else{
      if(responses.statusCode == 400){
        throw NotFoundException("NOT FOUND");
      }else{
        throw Exception("UNABLE TO LOAD");
      }
    }
  }
}

class NotFoundException implements Exception{
  String cause;
  NotFoundException(this.cause);
}