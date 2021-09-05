
import 'package:hive/hive.dart';

import 'otherMandiHive.dart';
part 'theDataHive.g.dart';

@HiveType(typeId: 1)
class DataHive {
  DataHive({
    required this.otherMandi,
  });

  @HiveField(0)
  List<OtherMandiHive> otherMandi;

  factory DataHive.fromJson(Map<String, dynamic> json) {
    return DataHive(
    otherMandi: List<OtherMandiHive>.from(json["other_mandi"].map((x) => OtherMandiHive.fromJson(x))),
  );
  }


}
