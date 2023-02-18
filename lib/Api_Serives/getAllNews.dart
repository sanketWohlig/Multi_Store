import 'dart:convert';

import 'package:http/http.dart';

import '../Models/AddBookmark.dart';
import '../Models/News.dart';
import 'api_call.dart';

Future<List<newsResponse>> getNews(String path) async {
  List<newsResponse> _list = [];
  Response response = await apicall.getWithAuth(path);
  var body = jsonDecode(response.body);
  body.forEach((data) {
    _list.add(newsResponse.fromJson(data));
  });
  return _list;
}

Future<AddBookmark> allbookmarks(String path) async {
  Response res = await apicall.postWithAuthWithoutBody(path);
  var body = jsonDecode(res.body);
  AddBookmark bookmark = AddBookmark.fromJson(body);
  return bookmark;
}

Future<AddBookmark> getbookmark(String path) async {
  Response res = await apicall.getWithAuth(path);
  var body = jsonDecode(res.body);
  AddBookmark bookmark = AddBookmark.fromJson(body);
  return bookmark;
}


