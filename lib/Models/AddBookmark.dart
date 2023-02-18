class AddBookmark {
  String? userId;
  String? newsId;
  String? status;
  String? sId;

  AddBookmark({this.userId, this.newsId, this.status, this.sId});

  AddBookmark.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    newsId = json['newsId'];
    status = json['status'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['newsId'] = newsId;
    data['status'] = status;
    data['_id'] = sId;
    return data;
  }
}