import 'dart:ffi';

class DetailResepMakananModel {
  String? method;
  bool? status;
  Results? results;

  DetailResepMakananModel({this.method, this.status, this.results});

  DetailResepMakananModel.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    status = json['status'];
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method'] = this.method;
    data['status'] = this.status;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class Results {
  String? title;
  Null? thumb;
  String? servings;
  String? times;
  String? difficulty;
  Author? author;
  String? desc;
  List<NeedItem>? needItem;
  List<String>? ingredient;
  List<String>? step;

  Results(
      {this.title,
      this.thumb,
      this.servings,
      this.times,
      this.difficulty,
      this.author,
      this.desc,
      this.needItem,
      this.ingredient,
      this.step});

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];

    servings = json['servings'];
    times = json['times'];
    difficulty = json['difficulty'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    desc = json['desc'];
    if (json['needItem'] != null) {
      needItem = <NeedItem>[];
      json['needItem'].forEach((v) {
        needItem!.add(new NeedItem.fromJson(v));
      });
    }
    ingredient = json['ingredient'].cast<String>();
    step = json['step'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['thumb'] = this.thumb;
    data['servings'] = this.servings;
    data['times'] = this.times;
    data['difficulty'] = this.difficulty;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['desc'] = this.desc;
    if (this.needItem != null) {
      data['needItem'] = this.needItem!.map((v) => v.toJson()).toList();
    }
    data['ingredient'] = this.ingredient;
    data['step'] = this.step;
    return data;
  }
}

class Author {
  String? user;
  String? datePublished;

  Author({this.user, this.datePublished});

  Author.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    datePublished = json['datePublished'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user'] = user;
    data['datePublished'] = datePublished;
    return data;
  }
}

class NeedItem {
  String? itemName;
  String? thumbItem;

  NeedItem({this.itemName, this.thumbItem});

  NeedItem.fromJson(Map<String, dynamic> json) {
    itemName = json['item_name'];
    thumbItem = json['thumb_item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['item_name'] = itemName;
    data['thumb_item'] = thumbItem;
    return data;
  }
}
