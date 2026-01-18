part of 'authentication_cubit.dart';

class AuthenticationState {
  final RequestState state;

  AuthenticationState({this.state = RequestState.initial});

  AuthenticationState copyWith({
    RequestState? state,
  }) {
    return AuthenticationState(
      state: state ?? this.state,
    );
  }
}
