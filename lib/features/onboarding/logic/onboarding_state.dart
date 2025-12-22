part of 'onboarding_cubit.dart';

class OnboardingState {
  final RequestState state;

  OnboardingState({this.state = RequestState.initial});

  OnboardingState copyWith({
    RequestState? state,
  }) {
    return OnboardingState(
      state: state ?? this.state,
    );
  }
}
