part of './bloc.dart';
abstract class CountryEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [
    //fields that distinguish objects
    //2 separated states => reload data
  ];
}
//event with parameters
class CountryEventGetAll extends CountryEvent {
  int page = 0 ;
  int limit = 10;
  CountryEventGetAll({
   required this.page,
   required this.limit
  });
  @override
  List<Object?> get props => [
    //2 events are separated ?
    page, limit
  ];
}
//other events, for fun...
class CountryEventInsert extends CountryEvent {
  @override
  List<Object?> get props => [];
}
class CountryEventUpdate extends CountryEvent {
  @override
  List<Object?> get props => [];
}
class CountryEventDelete extends Equatable {
  @override
  List<Object?> get props => [];
}