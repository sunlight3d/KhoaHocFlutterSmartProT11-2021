//shared state
part of './bloc.dart';
enum CountryStatus {
  initial,
  success,
  failed,
}
class CountryState extends Equatable {
  List<Country> countries; //initial state, not null!
  //when get data from API => success/failed
  CountryStatus countryStatus;
  String errorMessage;
  bool isLoading;
  //...other properties...
  CountryState({
    this.countries = const <Country>[],
    this.countryStatus = CountryStatus.initial,
    this.errorMessage = '',
    this.isLoading = true
  });
  //state is immutable, so newState = "cloned old state"
  CountryState copyWith({
    List<Country>? countries,
    CountryStatus? countryStatus,
    bool? isLoading,
  }) => CountryState(
      countries: countries ?? this.countries,
      countryStatus: countryStatus ?? this.countryStatus,
      isLoading: isLoading ?? false,
  );
  @override
  List<Object?> get props => [countries, countryStatus];
}