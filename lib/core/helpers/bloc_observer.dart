import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate -- ${bloc.runtimeType}', name: 'App bloc state');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange -- ${bloc.runtimeType}, $change', name: 'App bloc state');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    /// Called whenever an [error] occurs in any [Bloc] and it is possible
    /// that the [error] was not caught by the [Bloc] itself.
    ///
    /// [bloc] - The [BlocBase] that emitted the [error].

    log('onError -- ${bloc.runtimeType}, $error', name: 'App bloc state');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('onClose -- ${bloc.runtimeType}', name: 'App bloc state');
  }
}
