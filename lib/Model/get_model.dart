// To parse this JSON data, do
//
//     final hotelsModels = hotelsModelsFromJson(jsonString);

import 'dart:convert';

HotelsModels hotelsModelsFromJson(String str) =>
    HotelsModels.fromJson(json.decode(str));

String hotelsModelsToJson(HotelsModels data) => json.encode(data.toJson());

class HotelsModels {
  String q;
  String rid;
  String rc;
  List<Sr> sr;

  HotelsModels({
    required this.q,
    required this.rid,
    required this.rc,
    required this.sr,
  });

  factory HotelsModels.fromJson(Map<String, dynamic> json) => HotelsModels(
        q: json["q"],
        rid: json["rid"],
        rc: json["rc"],
        sr: List<Sr>.from(json["sr"].map((x) => Sr.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "q": q,
        "rid": rid,
        "rc": rc,
        "sr": List<dynamic>.from(sr.map((x) => x.toJson())),
      };
}

class Sr {
  Type type;
  String index;
  String? gaiaId;
  String srType;
  RegionNames regionNames;
  EssId essId;
  Coordinates coordinates;
  HierarchyInfo hierarchyInfo;
  String? hotelId;
  String? cityId;
  HotelAddress? hotelAddress;
  String? isMinorAirport;

  Sr({
    required this.type,
    required this.index,
    this.gaiaId,
    required this.srType,
    required this.regionNames,
    required this.essId,
    required this.coordinates,
    required this.hierarchyInfo,
    this.hotelId,
    this.cityId,
    this.hotelAddress,
    this.isMinorAirport,
  });

  factory Sr.fromJson(Map<String, dynamic> json) => Sr(
        type: typeValues.map[json["@type"]]!,
        index: json["index"],
        gaiaId: json["gaiaId"],
        srType: json["type"],
        regionNames: RegionNames.fromJson(json["regionNames"]),
        essId: EssId.fromJson(json["essId"]),
        coordinates: Coordinates.fromJson(json["coordinates"]),
        hierarchyInfo: HierarchyInfo.fromJson(json["hierarchyInfo"]),
        hotelId: json["hotelId"],
        cityId: json["cityId"],
        hotelAddress: json["hotelAddress"] == null
            ? null
            : HotelAddress.fromJson(json["hotelAddress"]),
        isMinorAirport: json["isMinorAirport"],
      );

  Map<String, dynamic> toJson() => {
        "@type": typeValues.reverse[type],
        "index": index,
        "gaiaId": gaiaId,
        "type": srType,
        "regionNames": regionNames.toJson(),
        "essId": essId.toJson(),
        "coordinates": coordinates.toJson(),
        "hierarchyInfo": hierarchyInfo.toJson(),
        "hotelId": hotelId,
        "cityId": cityId,
        "hotelAddress": hotelAddress?.toJson(),
        "isMinorAirport": isMinorAirport,
      };
}

class Coordinates {
  String lat;
  String long;

  Coordinates({
    required this.lat,
    required this.long,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json["lat"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
      };
}

class EssId {
  SourceName sourceName;
  String sourceId;

  EssId({
    required this.sourceName,
    required this.sourceId,
  });

  factory EssId.fromJson(Map<String, dynamic> json) => EssId(
        sourceName: sourceNameValues.map[json["sourceName"]]!,
        sourceId: json["sourceId"],
      );

  Map<String, dynamic> toJson() => {
        "sourceName": sourceNameValues.reverse[sourceName],
        "sourceId": sourceId,
      };
}

enum SourceName { GAI, LCM }

final sourceNameValues =
    EnumValues({"GAI": SourceName.GAI, "LCM": SourceName.LCM});

class HierarchyInfo {
  Country country;

  HierarchyInfo({
    required this.country,
  });

  factory HierarchyInfo.fromJson(Map<String, dynamic> json) => HierarchyInfo(
        country: Country.fromJson(json["country"]),
      );

  Map<String, dynamic> toJson() => {
        "country": country.toJson(),
      };
}

class Country {
  String? name;
  String? isoCode2;
  IsoCode3 isoCode3;

  Country({
    this.name,
    this.isoCode2,
    required this.isoCode3,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        isoCode2: json["isoCode2"],
        isoCode3: isoCode3Values.map[json["isoCode3"]]!,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "isoCode2": isoCode2,
        "isoCode3": isoCode3Values.reverse[isoCode3],
      };
}

enum IsoCode3 { USA }

final isoCode3Values = EnumValues({"USA": IsoCode3.USA});

class HotelAddress {
  String street;
  String city;
  String province;

  HotelAddress({
    required this.street,
    required this.city,
    required this.province,
  });

  factory HotelAddress.fromJson(Map<String, dynamic> json) => HotelAddress(
        street: json["street"],
        city: json["city"],
        province: json["province"],
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "province": province,
      };
}

class RegionNames {
  String fullName;
  String shortName;
  String displayName;
  String primaryDisplayName;
  SecondaryDisplayName secondaryDisplayName;
  String lastSearchName;

  RegionNames({
    required this.fullName,
    required this.shortName,
    required this.displayName,
    required this.primaryDisplayName,
    required this.secondaryDisplayName,
    required this.lastSearchName,
  });

  factory RegionNames.fromJson(Map<String, dynamic> json) => RegionNames(
        fullName: json["fullName"],
        shortName: json["shortName"],
        displayName: json["displayName"],
        primaryDisplayName: json["primaryDisplayName"],
        secondaryDisplayName:
            secondaryDisplayNameValues.map[json["secondaryDisplayName"]]!,
        lastSearchName: json["lastSearchName"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "shortName": shortName,
        "displayName": displayName,
        "primaryDisplayName": primaryDisplayName,
        "secondaryDisplayName":
            secondaryDisplayNameValues.reverse[secondaryDisplayName],
        "lastSearchName": lastSearchName,
      };
}

enum SecondaryDisplayName {
  LAS_VEGAS_NEVADA_UNITED_STATES,
  NEW_YORK_NEW_YORK_UNITED_STATES,
  NEW_YORK_UNITED_STATES
}

final secondaryDisplayNameValues = EnumValues({
  "Las Vegas, Nevada, United States":
      SecondaryDisplayName.LAS_VEGAS_NEVADA_UNITED_STATES,
  "New York, New York, United States":
      SecondaryDisplayName.NEW_YORK_NEW_YORK_UNITED_STATES,
  "New York, United States": SecondaryDisplayName.NEW_YORK_UNITED_STATES
});

enum Type { GAIA_HOTEL_RESULT, GAIA_REGION_RESULT }

final typeValues = EnumValues({
  "gaiaHotelResult": Type.GAIA_HOTEL_RESULT,
  "gaiaRegionResult": Type.GAIA_REGION_RESULT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
