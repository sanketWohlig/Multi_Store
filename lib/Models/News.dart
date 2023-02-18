class newsResponse {
  String? id;
  String? headline;
  String? fullContent;
  String? summary;
  String? points;
  String? tweet;
  String? tags;
  String? modelId;
  String? modelStatus;
  String? company;
  String? newsLink;
  String? image;
  List<String>? categories;
  String? publishTime;
  List<String>? sampleQnA;
  String? status;

  newsResponse({
    this.id,
    this.headline,
    this.fullContent,
    this.summary,
    this.points,
    this.tweet,
    this.tags,
    this.modelId,
    this.modelStatus,
    this.company,
    this.newsLink,
    this.image,
    this.categories,
    this.publishTime,
    this.sampleQnA,
    this.status,
  });

  newsResponse.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    headline = json['headline'];
    fullContent = json['fullContent'];
    summary = json['summary'];
    points = json['points'];
    tweet = json['tweet'];
    tags = json['tags'];
    modelId = json['modelId'];
    modelStatus = json['modelStatus'];
    company = json['company'];
    newsLink = json['newsLink'];
    image = json['image'];
    categories = json['categories'].cast<String>();
    publishTime = json['publishTime'];
    // if (json['sampleQnA'] != null) {
    //   // sampleQnA = [];
    //   json['sampleQnA'].forEach((v) {
    //     sampleQnA!.add(v);
    //   });
    // }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['headline'] = headline;
    data['fullContent'] = fullContent;
    data['summary'] = summary;
    data['points'] = points;
    data['tweet'] = tweet;
    data['tags'] = tags;
    data['modelId'] = modelId;
    data['modelStatus'] = modelStatus;
    data['company'] = company;
    data['newsLink'] = newsLink;
    data['image'] = image;
    data['categories'] = categories;
    data['publishTime'] = publishTime;
    // if (sampleQnA != null) {
    //   data['sampleQnA'] = sampleQnA!.toList();
    // }
    data['status'] = status;
    return data;
  }
}
