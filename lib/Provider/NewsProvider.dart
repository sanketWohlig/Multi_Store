import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../Api_Serives/getAllNews.dart';
import '../Models/AddBookmark.dart';
import '../Models/News.dart';

class NewsProvider extends ChangeNotifier {
  List<newsResponse>? newsdata;
  // AddBookmark? bookmarks;
  int currentindex = 0;
  getallnews() async {
    newsdata = await getNews('/news/mynews/all');
    notifyListeners();
  }

  setindex(int index) {
    currentindex = index;
    notifyListeners();
  }

  // addAllBookmarks(String id) async {
  //   var res = await allbookmarks('/bookmark/addBookmark/$id');
  //   // print(res.newsId);
  //   notifyListeners();
  // }

  // getAllBookmart() async {
  //   var res = await getbookmark('/bookmark/getBookmarkData');
  // }
}
