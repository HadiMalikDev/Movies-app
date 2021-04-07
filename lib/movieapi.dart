import 'dart:convert';

import 'package:http/http.dart' as http;

const String _apiKey = "6a0297f1";

class MovieApi {
  static getMovie(String name) async {
    
    http.Response response = await http.get(
    Uri.http('omdbapi.com','',{'apikey':_apiKey,'t':name,'plot':'full'})  
    );
    if(response.statusCode==200)
      return jsonDecode(response.body);
    else return null;
  }
}
