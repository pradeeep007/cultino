import 'package:hive/hive.dart';

part 'otherMandiHive.g.dart';

@HiveType(typeId: 2)
class OtherMandiHive {
  OtherMandiHive({
    required this.cropId,
    required this.district,
    required this.districtId,
    required this.hindiName,
    required this.id,
    required this.image,
    required this.km,
    required this.lastDate,
    required this.lat,
    required this.lng,
    required this.location,
    required this.market,
    required this.meters,
    required this.state,
    this.urlStr,
  });

  @HiveField(0)
  int cropId;

  @HiveField(1)
  String district;

  @HiveField(2)
  int districtId;

  @HiveField(3)
  String hindiName;

  @HiveField(4)
  int id;

  @HiveField(5)
  String image;

  @HiveField(6)
  double km;

  @HiveField(7)
  String lastDate;

  @HiveField(8)
  double lat;

  @HiveField(9)
  double lng;

  @HiveField(10)
  String location;

  @HiveField(11)
  String market;

  @HiveField(12)
  double meters;

  @HiveField(13)
  String state;

  @HiveField(14)
  String? urlStr;

  factory OtherMandiHive.fromJson(Map<String, dynamic> json) => OtherMandiHive(
        cropId: json["crop_id"],
        district: json["district"],
        districtId: json["district_id"],
        hindiName: json["hindi_name"],
        id: json["id"],
        image: json["image"],
        km: json["km"].toDouble(),
        lastDate: json["last_date"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        location: json["location"],
        market: json["market"],
        meters: json["meters"].toDouble(),
        state: json["state"],
        urlStr: json["url_str"] == null ? null : json["url_str"],
      );

  Map<String, dynamic> toJson() => {
        "crop_id": cropId,
        "district": district,
        "district_id": districtId,
        "hindi_name": hindiName,
        "id": id,
        "image": image,
        "km": km,
        "last_date": lastDate,
        "lat": lat,
        "lng": lng,
        "location": location,
        "market": market,
        "meters": meters,
        "state": state,
        "url_str": urlStr == null ? null : urlStr,
      };
}
