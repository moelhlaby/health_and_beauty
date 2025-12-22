part of 'notifications_cubit.dart';

class NotificationsState {
  final RequestState state;

  NotificationsState({this.state = RequestState.initial});

  NotificationsState copyWith({
    RequestState? state,
  }) {
    return NotificationsState(
      state: state ?? this.state,
    );
  }
}
