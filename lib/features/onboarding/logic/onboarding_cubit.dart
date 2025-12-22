import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:healthAndBeauty/core/networking/enums/request_state.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState());
}