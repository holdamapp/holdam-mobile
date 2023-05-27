import 'package:holdam_mobile/database/models/user.dart';
import 'package:objectbox/objectbox.dart';

import 'benefit.dart' show Benfit;
import 'user.dart' show User;

@Entity()
class Coupon {
  @Id()
  int id = 0;

  final user = ToOne<User>();
  final benefit = ToOne<Benfit>();

  int studyTime = 0; // in seconds
  // TODO: consider using enum or another entity
  String status = ''; // not_started, in_progress, completed, used
}
