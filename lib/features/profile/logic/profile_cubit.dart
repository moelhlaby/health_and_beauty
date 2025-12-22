import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:healthAndBeauty/core/networking/enums/request_state.dart';
import 'package:healthAndBeauty/features/profile/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(ProfileState());

  Future<void> getProfileData() async {
    emit(state.copyWith(state: RequestState.loading));
    final result = await _profileRepo.getProfileData();
    result.when(
      failure: (l) => emit(state.copyWith(state: RequestState.error)),
      success: (r) => emit(state.copyWith(state: RequestState.success)),
    );
  }
}
