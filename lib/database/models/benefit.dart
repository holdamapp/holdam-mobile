import 'package:objectbox/objectbox.dart';

import 'coupon.dart' show Coupon;
import 'partner.dart' show Partner;

@Entity()
class Benfit {
  @Id()
  int id = 0;

  @Backlink('benfit')
  final coupons = ToMany<Coupon>();

  final resto = ToOne<Partner>();

  int amountOfCoupons = 0;
  int timeToComplete = 0; // in seconds

  @Property(type: PropertyType.date)
  DateTime startDate = DateTime.now();

  @Property(type: PropertyType.date)
  DateTime? endDate; // TODO: maybe named it as expiredDate or exirationDate

  String description = '';

  Benfit(this.id);
}
