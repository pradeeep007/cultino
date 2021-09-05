import 'package:hive/hive.dart';
part 'gender.g.dart';

@HiveType(typeId: 4)
enum Gender {
@HiveField(0)
Male,
@HiveField(1)
Female,
}