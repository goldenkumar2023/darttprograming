import 'dart:convert';

GetApiModel getApiModelFromJson(String str) =>
    GetApiModel.fromJson(json.decode(str));

String getApiModelToJson(GetApiModel data) => json.encode(data.toJson());

class GetApiModel {
  String term;
  int moresuggestions;
  dynamic autoSuggestInstance;
  String trackingId;
  bool misspellingfallback;
  List<Suggestion> suggestions;
  bool geocodeFallback;

  GetApiModel({
    required this.term,
    required this.moresuggestions,
    required this.autoSuggestInstance,
    required this.trackingId,
    required this.misspellingfallback,
    required this.suggestions,
    required this.geocodeFallback,
  });

  factory GetApiModel.fromJson(Map<String, dynamic> json) => GetApiModel(
        term: json["term"],
        moresuggestions: json["moresuggestions"],
        autoSuggestInstance: json["autoSuggestInstance"],
        trackingId: json["trackingID"],
        misspellingfallback: json["misspellingfallback"],
        suggestions: List<Suggestion>.from(
            json["suggestions"].map((x) => Suggestion.fromJson(x))),
        geocodeFallback: json["geocodeFallback"],
      );

  get sr => null;

  //get sr => null;

  Map<String, dynamic> toJson() => {
        "term": term,
        "moresuggestions": moresuggestions,
        "autoSuggestInstance": autoSuggestInstance,
        "trackingID": trackingId,
        "misspellingfallback": misspellingfallback,
        "suggestions": List<dynamic>.from(suggestions.map((x) => x.toJson())),
        "geocodeFallback": geocodeFallback,
      };
}

class Suggestion {
  String group;
  List<Entity> entities;

  Suggestion({
    required this.group,
    required this.entities,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
        group: json["group"],
        entities:
            List<Entity>.from(json["entities"].map((x) => Entity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "group": group,
        "entities": List<dynamic>.from(entities.map((x) => x.toJson())),
      };
}

class Entity {
  String geoId;
  String destinationId;
  String? landmarkCityDestinationId;
  String type;
  RedirectPage redirectPage;
  double latitude;
  double longitude;
  dynamic searchDetail;
  String caption;
  String name;

  Entity({
    required this.geoId,
    required this.destinationId,
    required this.landmarkCityDestinationId,
    required this.type,
    required this.redirectPage,
    required this.latitude,
    required this.longitude,
    required this.searchDetail,
    required this.caption,
    required this.name,
  });

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        geoId: json["geoId"],
        destinationId: json["destinationId"],
        landmarkCityDestinationId: json["landmarkCityDestinationId"],
        type: json["type"],
        redirectPage: redirectPageValues.map[json["redirectPage"]]!,
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        searchDetail: json["searchDetail"],
        caption: json["caption"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "geoId": geoId,
        "destinationId": destinationId,
        "landmarkCityDestinationId": landmarkCityDestinationId,
        "type": type,
        "redirectPage": redirectPageValues.reverse[redirectPage],
        "latitude": latitude,
        "longitude": longitude,
        "searchDetail": searchDetail,
        "caption": caption,
        "name": name,
      };
}

enum RedirectPage { DEFAULT_PAGE }

final redirectPageValues =
    EnumValues({"DEFAULT_PAGE": RedirectPage.DEFAULT_PAGE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
