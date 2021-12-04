part of 'weather_bloc.dart';

/**
  - event: Country send event "get All Country" to Bloc
  - bloc receive event, call API, emit some States (success, failed..)
  - After emit States, some Screen received
 */
/*
- event: userA send message chat
- message chat is inserted to Server
- Server send notification to FCM(Firebase Cloud messaging)
- FCM notifies userB(using deviceID) 
* */
class WeatherState extends Equatable {
  // const WeatherState({
  //
  // });


/*
  PostState copyWith({
    PostStatus? status,
    List<Post>? posts,
    bool? hasReachedMax,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
*/
  @override
  String toString() {
    return '';
  }

  @override
  List<Object> get props => [];
}
