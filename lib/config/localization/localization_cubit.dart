// // ignore_for_file: public_member_api_docs, sort_constructors_first
// // lib/core/localization/cubit/localization_cubit.dart

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class LocalizationCubit extends Cubit<LocalizationState> {
//   LocalizationCubit() : super(LocalizationState());

//   void changeLanguage(BuildContext context) async {
//     final currentLocale = context.locale;
//     final newLocale = currentLocale.languageCode == 'en'
//         ? const Locale('ar')
//         : const Locale('en');

//     await context.setLocale(newLocale);
//     emit(state.copyWith(locale: newLocale));
//   }

//   void setInitialLocale(Locale locale) {
//     emit(state.copyWith(locale: locale));
//   }
// } // lib/core/localization/cubit/localization_state.dart

// class LocalizationState {
//   final Locale? locale;
//   LocalizationState({this.locale});

//   LocalizationState copyWith({
//     Locale? locale,
//   }) {
//     return LocalizationState(
//       locale: locale ?? this.locale,
//     );
//   }
// }
