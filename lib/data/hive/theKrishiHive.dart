import 'package:cultino/data/hive/theDataHive.dart';

import 'package:hive/hive.dart';

part 'theKrishiHive.g.dart';

@HiveType(typeId: 0)
class APICacheHive extends HiveObject {
  @HiveField(0)
  late DataHive data;
}
