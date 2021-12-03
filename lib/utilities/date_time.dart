//function with named parameters
//let's refactor this function
import 'package:intl/intl.dart';
final DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
int yearsBetween({DateTime? from, DateTime? to}) {
  if(from == null || to == null) {
    return 0;
  }
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / (24*365)).round();
}
DateTime convertStringToDateTime(String stringDateTime)
  => dateFormat.parse(stringDateTime);
String convertDateTimeToString(DateTime datetime)
  => dateFormat.format(datetime);