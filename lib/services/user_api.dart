import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

 import "package:bloc_kokorin_web_4/models/user.dart";


class UserProvider{

    Future<List<User>> getUser() async {

      final response = await http.get('https://jsonplaceholder.typicode.com/users');

      if(response.statusCode == 200){
            final List<dynamic> userJson = json.decode(response.body);
            return userJson.map((json)=> User.fromJson(json)).toList();
      }else{
        throw Exception('Error');
      }
    }
}