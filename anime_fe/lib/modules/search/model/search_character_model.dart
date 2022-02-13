class SearchCharacterModel {
  Data data;

  SearchCharacterModel({this.data});

  SearchCharacterModel.fromJson(Map<String, dynamic> json) {
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
  List<Characters> characters;

  Data({this.characters});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['characters'] != null) {
      characters = <Characters>[];
      json['characters'].forEach((v) {
        characters.add(new Characters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.characters != null) {
      data['characters'] = this.characters.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Characters {
  int malId;
  String name;
  int favorites;
  List<String> nicknames;
  Images images;

  Characters(
      {this.malId, this.name, this.favorites, this.nicknames, this.images});

  Characters.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    name = json['name'];
    favorites = json['favorites'];
    nicknames = json['nicknames'].cast<String>();
    images =
    json['images'] != null ? new Images.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['name'] = this.name;
    data['favorites'] = this.favorites;
    data['nicknames'] = this.nicknames;
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