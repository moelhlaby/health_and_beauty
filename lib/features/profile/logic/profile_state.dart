part of 'profile_cubit.dart';

class ProfileState {
  final RequestState state;

  ProfileState({this.state = RequestState.initial});

  ProfileState copyWith({
    RequestState? state,
  }) {
    return ProfileState(
      state: state ?? this.state,
    );
  }
}
