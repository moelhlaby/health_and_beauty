import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:healthAndBeauty/core/networking/enums/request_state.dart';
import 'package:healthAndBeauty/features/authentication/data/repo/authentication_repo.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepo _authenticationRepo;
  AuthenticationCubit(this._authenticationRepo) : super(AuthenticationState());

  Future<void> getAuthenticationData() async {
    emit(state.copyWith(state: RequestState.loading));
    final result = await _authenticationRepo.getAuthenticationData();
    result.when(
      failure: (l) => emit(state.copyWith(state: RequestState.error)),
      success: (r) => emit(state.copyWith(state: RequestState.success)),
    );
  }
}