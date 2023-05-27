import 'package:objectbox/objectbox.dart';

import 'benefit.dart' show Benfit;
import 'user.dart' show User;

@Entity()
class Partner {
  int id = 0;

  final followers = ToMany<User>();

  @Backlink('partner')
  final benefit = ToMany<Benfit>();

  String address = '';
  int likes = 0;
}
