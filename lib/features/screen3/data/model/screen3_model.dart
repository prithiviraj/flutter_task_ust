class Screen3Model {
  List<Result> resultList;

  Screen3Model({this.resultList});

  Screen3Model.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      resultList = <Result>[];
      json['results'].forEach((v) {
        resultList.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.resultList != null) {
      data['results'] = this.resultList;
    }
    return data;
  }
}

class Result {
  String title;
  String image;
  String text1;
  String text2;
  String text3;

  Result({this.title, this.image, this.text1, this.text2, this.text3});

  Result.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    text1 = json['text1'];
    text2 = json['text2'];
    text3 = json['text3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['text1'] = this.text1;
    data['text2'] = this.text2;
    data['text3'] = this.text3;
    return data;
  }
}
