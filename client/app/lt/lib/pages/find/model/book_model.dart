class BookModel {
  String classify;
  int date;
  List<Data> data;

  BookModel({this.classify, this.date, this.data});

  BookModel.fromJson(Map<String, dynamic> json) {
    classify = json['classify'];
    date = json['date'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classify'] = this.classify;
    data['date'] = this.date;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String name;
  String thumbnail;
  String describe;
  int num;

  Data({this.name, this.thumbnail, this.describe, this.num});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    thumbnail = json['thumbnail'];
    describe = json['describe'];
    num = json['num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['thumbnail'] = this.thumbnail;
    data['describe'] = this.describe;
    data['num'] = this.num;
    return data;
  }
}
