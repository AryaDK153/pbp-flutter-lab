// To parse this JSON data, do
//
//     final myWatchList = myWatchListFromJson(jsonString);

import 'dart:convert';

List<MyWatchList> myWatchListFromJson(String str) => List<MyWatchList>.from(json.decode(str).map((x) => MyWatchList.fromJson(x)));

String myWatchListToJson(List<MyWatchList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchList {
  MyWatchList({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  // Model model;
  // String model;
  int pk;
  Fields fields;

  factory MyWatchList.fromJson(Map<String, dynamic> json) => MyWatchList(
    model: modelValues.map[json["model"]],
    // model: modelValues.map[json["model"]]!,
    // model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": modelValues.reverse![model],
    // "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.title,
    required this.watched,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  String title;
  Watched? watched;
  // Watched watched;
  // String watched;
  int rating;
  String releaseDate;
  String review;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    title: json["title"],
    watched: watchedValues.map[json["watched"]],
    // watched: watchedValues.map[json["watched"]]!,
    // watched: json["watched"],
    rating: json["rating"],
    releaseDate: json["release_date"],
    review: json["review"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "watched": watchedValues.reverse![watched],
    // "watched": watched,
    "rating": rating,
    "release_date": releaseDate,
    "review": review,
  };
}

enum Watched { ONGOING, COMPLETED, QUEUED }

final watchedValues = EnumValues({
  "Completed": Watched.COMPLETED,
  "Ongoing": Watched.ONGOING,
  "Queued": Watched.QUEUED
});

enum Model { MYWATCHLIST_ATTRIBUTEWATCHLIST }

final modelValues = EnumValues({
  "mywatchlist.attributewatchlist": Model.MYWATCHLIST_ATTRIBUTEWATCHLIST
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
