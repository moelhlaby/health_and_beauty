import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:healthAndBeauty/core/networking/enums/request_state.dart';
import 'package:healthAndBeauty/features/notifications/data/repo/notifications_repo.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepo _notificationsRepo;
  NotificationsCubit(this._notificationsRepo) : super(NotificationsState());

  Future<void> getNotificationsData() async {
    emit(state.copyWith(state: RequestState.loading));
    final result = await _notificationsRepo.getNotificationsData();
    result.when(
      failure: (l) => emit(state.copyWith(state: RequestState.error)),
      success: (r) => emit(state.copyWith(state: RequestState.success)),
    );
  }
}
