import 'package:cultino/data/hive/otherMandiHive.dart';
import 'package:cultino/data/hive/profileHive.dart';
import 'package:cultino/data/hive/theDataHive.dart';
import 'package:cultino/data/hive/theKrishiHive.dart';
import 'package:hive/hive.dart';


class Boxes {
  static Box<APICacheHive> getApiCache() =>
      Hive.box<APICacheHive>("apicache");

  static Box<DataHive> getData() =>
      Hive.box<DataHive>("datahive");

  static Box<OtherMandiHive> getOtherMandi() =>
      Hive.box<OtherMandiHive>("othermandi");

  static Box<Profile> getProfile() =>
      Hive.box<Profile>("profile");


}
