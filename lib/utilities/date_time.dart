//function with named parameters
//let's refactor this function
int yearsBetween({DateTime? from, DateTime? to}) {
  if(from == null || to == null) {
    return 0;
  }
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / (24*365)).round();
}