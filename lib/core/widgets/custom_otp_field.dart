import 'dart:ui' as ui;

import 'package:pinput/pinput.dart';

import '../../config/export/export.dart';

class CustomOtpField extends StatefulWidget {
  final int length;
  final TextEditingController? controller;
  final void Function(String)? onCompleted;
  const CustomOtpField({
    super.key,
    this.length = 4,
    this.controller,
    this.onCompleted,
  });

  @override
  State<CustomOtpField> createState() => _CustomOtpFieldState();
}

class _CustomOtpFieldState extends State<CustomOtpField> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: Pinput(
          length: widget.length,
          controller: widget.controller,
          defaultPinTheme: PinTheme(
            width: 70,
            height: 70,
            textStyle: TextStyle(
              fontSize: 40.sp,
              color: DynamicColors.textColor(context),
              fontWeight: FontWeight.w500,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: DynamicColors.textFieldBorderColor(context)),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          focusedPinTheme: PinTheme(
            width: 70,
            height: 70,
            textStyle: TextStyle(
              fontSize: 40.sp,
              color: DynamicColors.textColor(context),
              fontWeight: FontWeight.w500,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: AppColors.mainAppColor),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          submittedPinTheme: PinTheme(
            width: 70,
            height: 70,
            textStyle: TextStyle(
              fontSize: 40.sp,
              color: DynamicColors.textColor(context),
              fontWeight: FontWeight.w500,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: AppColors.mainAppColor),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          errorPinTheme: PinTheme(
            width: 70,
            height: 70,
            textStyle: TextStyle(
              fontSize: 40.sp,
              color: DynamicColors.textColor(context),
              fontWeight: FontWeight.w500,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.red.shade700),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          errorBuilder: (errorText, pin) {
            return Align(
              alignment: context.getByLang(
                ar: AlignmentDirectional.centerEnd,
                en: AlignmentDirectional.centerStart,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  errorText!,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red.shade700,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            );
          },
          validator: (s) {
            return s!.trim().length == widget.length
                ? null
                : context.apiTr(
                    ar: 'الكود مكون من ${widget.length} ارقام',
                    en: 'The code consists of ${widget.length} digits',
                  );
          },
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onCompleted: widget.onCompleted,
        ),
      ),
    );
  }
}
