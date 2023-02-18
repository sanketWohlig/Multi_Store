import 'dart:convert';

import 'package:http/http.dart';

import '../Models/ChatList.dart';
import 'api_call.dart';

Future sendQestionGPT(String path, String question) async {
  Response response =
      await apicall.postWithAuth(path, json.encode({'question': question}));
  var body = jsonDecode(response.body);
  // if(response.statusCode==200)
  return response;
}

Future<List<ChatsList>> getAllChats(String path) async {
  List<ChatsList> _list = [];
  Response response = await apicall.getWithAuth(path);
  print(response.statusCode);
  var body = jsonDecode(response.body);
  body.forEach((data) {
    _list.add(ChatsList.fromJson(data));
  });
  print('object');
  return _list;
}
