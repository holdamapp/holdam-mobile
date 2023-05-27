import 'package:objectbox/objectbox.dart';

import 'coupon.dart' show Coupon;
import 'partner.dart' show Partner;

@Entity()
class User {
  @Id()
  int id = 0;

  @Backlink('user')
  final coupons = ToMany<Coupon>();

  @Backlink('followers')
  final followingsPartners = ToMany<Partner>();
}
