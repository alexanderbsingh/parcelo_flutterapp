import 'package:http/http.dart';
import 'dart:convert';
import 'package:parcelo/globalVar.dart';

makeSignInRequest() async {
  String url = 'http://' + host + ':3000/api/users/signin';
  Map<String, String> data = {"email": "test@test.com", "password": "12345678"};

  Response response = await post(url, body: json.encode(data), headers: {"Content-Type": "application/json"});
  //print(response.body);
  Map<String, dynamic> user = jsonDecode(response.body);

  userToken = user['token'];
  print('Token, ${user['token']}');
}