class SearchAnimeModel {
  Data data;

  SearchAnimeModel({this.data});

  SearchAnimeModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Animes> animes;

  Data({this.animes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['animes'] != null) {
      animes = <Animes>[];
      json['animes'].forEach((v) {
        animes.add(new Animes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.animes != null) {
      data['animes'] = this.animes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Animes {
  String titleEnglish;
  String type;
  int episodes;
  String score;
  Images images;

  Animes(
      {this.titleEnglish, this.type, this.episodes, this.score, this.images});

  Animes.fromJson(Map<String, dynamic> json) {
    titleEnglish = json['title_english'];
    type = json['type'];
    episodes = json['episodes'];
    score = json['score'];
    images =
    json['images'] != null ? new Images.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title_english'] = this.titleEnglish;
    data['type'] = this.type;
    data['episodes'] = this.episodes;
    data['score'] = this.score;
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    return data;
  }
}

class Images {
  Jpg jpg;

  Images({this.jpg});

  Images.fromJson(Map<String, dynamic> json) {
    jpg = json['jpg'] != null ? new Jpg.fromJson(json['jpg']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jpg != null) {
      data['jpg'] = this.jpg.toJson();
    }
    return data;
  }
}

class Jpg {
  String imageUrl;

  Jpg({this.imageUrl});

  Jpg.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_url'] = this.imageUrl;
    return data;
  }
}