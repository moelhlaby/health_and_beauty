import '../../config/export/export.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Color? enabledColor, cursorColor, fillColor, focusColor;
  final double? tPadding, bPadding, borderRadius;
  final TextInputType? type;
  final bool? isPassword, hasShadow;
  final int? maxLine, hintMaxLine;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validate;
  final String? hintText, labelText;
  final String? title; // ⬅️ العنوان الجديد
  final TextStyle? titleStyle; // ⬅️ ستايل العنوان
  final String? value;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? suffixPressed;
  final bool? isClickable;
  final bool? autoCorrect, isFill;
  final TextStyle? textStyle, hintTextStyle;
  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final ValueChanged<String>? onFieldSubmitted;
  final void Function(PointerDownEvent)? onTapOutside;
  final Function()? onTap;
  final ValueChanged<String>? onChanged;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;

  const AppTextField({
    super.key,
    this.textInputAction,
    this.borderRadius,
    this.maxLine,
    this.textAlign,
    this.controller,
    this.type,
    this.focusNode,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.onTap,
    this.textStyle,
    this.isPassword,
    this.validate,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixPressed,
    this.isClickable,
    this.autoCorrect,
    this.focusColor,
    this.enabledColor,
    this.tPadding,
    this.enabled,
    this.isFill,
    this.inputFormatters,
    this.fillColor,
    this.bPadding,
    this.onEditingComplete,
    this.hintMaxLine,
    this.cursorColor,
    this.hintTextStyle,
    this.autovalidateMode,
    this.onTapOutside,
    this.hasShadow = false,
    this.value,
    this.labelText,
    this.title, // ⬅️ جديد
    this.titleStyle, // ⬅️ جديد
  });

  @override
  Widget build(BuildContext context) {
    bool visible = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ------- Title --------
        if (title != null && title != "") ...[
          Text(
            title!,
            style:
                titleStyle ??
                TextStyles.styleMedium16(
                  context,
                ).copyWith(fontWeight: FontWeight.w600),
          ),
          12.h.verticalSpace,
        ],

        /// ------- Label --------
        if (labelText != null && labelText != "") ...[
          AppText(
            text: labelText ?? "",
            appTextStyle:
                textStyle ?? TextStyles.styleMedium16(context).copyWith(),
          ),
          8.h.verticalSpace,
        ],

        StatefulBuilder(
          builder: (context, setState) {
            return TextFormField(
              controller: controller,
              keyboardType: type,
              obscureText: isPassword == true ? visible : false,
              cursorErrorColor: AppColors.textError,
              textInputAction: textInputAction ?? TextInputAction.done,
              readOnly: isClickable ?? false,
              focusNode: focusNode,
              maxLines: isPassword == true ? 1 : maxLine,
              inputFormatters: inputFormatters,
              onTapOutside: onTapOutside,
              onSaved: onSaved,
              onEditingComplete: onEditingComplete,
              onTap: onTap,
              onFieldSubmitted: onFieldSubmitted,
              onChanged: onChanged,
              validator:
                  validate ??
                  (value) => AppValidation.validateEmptyField(value),
              obscuringCharacter: "*",
              initialValue: value,
              cursorColor: cursorColor ?? AppColors.mainAppColor,
              style:
                  textStyle ??
                  TextStyles.styleH1Bold25(context).copyWith(
                    fontSize: 15.sp,
                    color: DynamicColors.textColor(context),
                  ),
              textAlign: textAlign ?? TextAlign.start,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle:
                    hintTextStyle ??
                    TextStyles.styleParagraphRegular14(
                      context,
                      color: DynamicColors.textSubtitle(context),
                    ),
                hintMaxLines: hintMaxLine ?? 500,
                floatingLabelStyle: TextStyles.styleH1Bold25(
                  context,
                ).copyWith(color: AppColors.mainAppColor),
                filled: isFill ?? true,
                fillColor: fillColor ?? Colors.transparent,
                errorStyle: TextStyles.styleH1Bold25(context).copyWith(
                  color: AppColors.textError,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                prefixIcon: prefixIcon?.paddingAll(12),
                suffixIcon: isPassword == true
                    ? InkWell(
                        onTap: () => setState(() => visible = !visible),
                        child: Icon(
                          visible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 20.r,
                          color: DynamicColors.textColor(context),
                        ),
                      )
                    : suffixIcon,
                contentPadding: EdgeInsets.only(
                  left: 15.w,
                  right: 15.w,
                  top: tPadding ?? 15.h,
                  bottom: bPadding ?? 15.h,
                ),
                focusedBorder: (enabled == true)
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: focusColor ?? AppColors.mainAppColor,
                        ),
                      )
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          borderRadius ?? 8.r,
                        ),
                        borderSide: BorderSide(
                          color: focusColor ?? AppColors.mainAppColor,
                        ),
                      ),
                enabledBorder: (enabled == true)
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: enabledColor ?? Colors.transparent,
                        ),
                      )
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          borderRadius ?? 8.r,
                        ),
                        borderSide: BorderSide(
                          color:
                              enabledColor ??
                              DynamicColors.textFieldBorderColor(context),
                        ),
                      ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
                  borderSide: const BorderSide(color: AppColors.textError),
                ),
              ),
              autovalidateMode:
                  autovalidateMode ?? AutovalidateMode.onUserInteraction,
            );
          },
        ),
      ],
    );
  }
}
