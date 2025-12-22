import 'dart:io';

//! -----------   ZoomImageArgs ------------ //
class ZoomImageArgs {
  final String? imageUrl;
  final File? imageFile;

  const ZoomImageArgs({
    this.imageUrl,
    this.imageFile,
  });
}

//! -----------   app main RoutesArguments  ------------ //
class RoutesArgs {
  final int? intNum;
  final double? doubleNum;
  final String? string1;
  final String? string2;

  RoutesArgs(
      {required this.intNum,
      required this.doubleNum,
      required this.string1,
      required this.string2});

  RoutesArgs copyWith({
    int? intNum,
    double? doubleNum,
    String? string1,
    String? string2,
  }) {
    return RoutesArgs(
      intNum: intNum ?? this.intNum,
      doubleNum: doubleNum ?? this.doubleNum,
      string1: string1 ?? this.string1,
      string2: string2 ?? this.string2,
    );
  }
}
