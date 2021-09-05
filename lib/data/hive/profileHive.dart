import 'package:hive/hive.dart';
import 'gender/gender.dart';
part 'profileHive.g.dart';


@HiveType(typeId: 3)
class Profile{
  Profile({required this.gender,required this.name,required this.email,required this.path});

  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  Gender gender;

  @HiveField(3)
  String path;




}


