class SwiperModel {
  String title;
  String img;

  SwiperModel({this.title, this.img});

  SwiperModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['img'] = this.img;
    return data;
  }
}
