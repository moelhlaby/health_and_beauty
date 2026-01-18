// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui' as ui;

import 'package:healthAndBeauty/core/helpers/main_function.dart';

import '../../config/export/export.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final Widget? prefixIcon;
  final bool? enabled;

  final double? tPadding, bPadding, borderRadius;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final AutovalidateMode? autoValidateMode;

  final int? hintMaxLine;
  final TextStyle? floatingLabelStyle;
  final Widget? suffixIcon;
  final bool? obscureText;
  final Color? enabledColor, cursorColor, fillColor, focusColor;
  final List<String>? autofillHints;
  final TextInputType? keyboardType;
  final bool? autoCorrect, isFill;
  final ValueChanged<String>? onFieldSubmitted;
  final String? title;
  final String? otherSideTitle;
  final ui.TextDirection? textDirection;

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final void Function()? onTap;
  final int? maxLength;
  final int? maxLines;
  final bool? readOnly;
  final InputBorder? inputBorder;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onEditingComplete;

  // الإضافات الجديدة
  final bool showCountry;
  final List<CountryItem>? countries;
  final CountryItem? selectedCountry;
  final void Function(CountryItem?)? onCountryChanged;
  final String initValue;

  const CustomTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.autofillHints = const [],
    this.keyboardType,
    this.controller,
    this.validator,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.onTap,
    this.maxLength,
    this.maxLines = 1,
    this.readOnly = false,
    this.inputBorder,
    this.inputFormatters = const [],
    this.labelStyle,
    this.hintStyle,
    this.tPadding,
    this.bPadding,
    this.borderRadius,
    this.textAlign,
    this.focusNode,
    this.hintMaxLine,
    this.floatingLabelStyle,
    this.fillColor,
    this.autoCorrect,
    this.isFill,
    this.enabledColor,
    this.cursorColor,
    this.focusColor,
    this.enabled,
    this.autoValidateMode,
    this.onFieldSubmitted,
    this.title,
    this.otherSideTitle,
    this.textDirection,
    this.showCountry = false,
    this.countries,
    this.selectedCountry,
    this.onCountryChanged,
    this.onEditingComplete,
    this.onTapOutside,
    this.initValue = '',
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null || widget.otherSideTitle != null) ...[
            Row(
              children: [
                if (widget.title != null) ...[
                  Expanded(
                    child: Text(
                      widget.title!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: DynamicColors.textColor(context),
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 6),
          ],
          Directionality(
            textDirection: widget.textDirection != null
                ? widget.textDirection!
                : context.isRTL()
                ? ui.TextDirection.rtl
                : ui.TextDirection.ltr,
            child: Row(
              children: [
                if (widget.showCountry && widget.countries != null) ...[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: DynamicColors.textColor(context),
                      border: Border.all(color: DynamicColors.border(context)),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<CountryItem>(
                        value: widget.selectedCountry,
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: widget.onCountryChanged,
                        items: widget.countries!
                            .map(
                              (country) => DropdownMenuItem(
                                value: country,
                                child: Row(
                                  children: [
                                    Text(country.flag),
                                    const SizedBox(width: 6),
                                    Text(
                                      country.code,
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                ],
                Expanded(
                  child: TextFormField(
                    onEditingComplete: widget.onEditingComplete,
                    onFieldSubmitted: widget.onFieldSubmitted,
                    textAlign: widget.textAlign ?? TextAlign.start,
                    focusNode: widget.focusNode,
                    validator:
                        widget.validator ??
                        (value) {
                          if (value == null || value.isEmpty) {
                            return isEnglish()
                                ? "This field can't be empty"
                                : "لا يمكن ان يكون هذا الحقل فارغا";
                          }
                          return null;
                        },
                    readOnly: widget.readOnly ?? false,
                    onTap: widget.onTap,
                    onTapOutside: widget.onTapOutside,
                    // initialValue: widget.initValue,
                    obscureText: widget.obscureText == true
                        ? _obscureText
                        : false,
                    controller: widget.controller,cursorColor: Colors.black,
                    keyboardType: widget.keyboardType,
                    onChanged: widget.onChanged,
                    maxLength: widget.maxLength,
                    autofillHints: widget.autofillHints,
                    maxLines: widget.maxLines,
                    inputFormatters: widget.inputFormatters,
                    textInputAction: widget.textInputAction,
                    autovalidateMode:
                        widget.autoValidateMode ?? AutovalidateMode.onUnfocus,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 40.r,
                        ),
                        borderSide: BorderSide(color: AppColors.mainAppColor),
                      ),
                      labelText: widget.labelText,
                      labelStyle:
                          widget.labelStyle ??
                          TextStyles.styleSubtitleMedium14(context),
                      hintStyle:
                          widget.hintStyle ??
                          TextStyles.styleSubtitleMedium14(context),
                      hintMaxLines: widget.hintMaxLine ?? 500,
                      floatingLabelStyle:
                          widget.floatingLabelStyle ??
                          TextStyles.styleSubtitleMedium10(context),
                      hintText: widget.hintText,
                      prefixIcon: widget.prefixIcon,
                      filled: widget.isFill ?? true,
                      errorStyle: TextStyle(
                        color: AppColors.textError,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      errorMaxLines: 1,
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 50,
                        minHeight: 0,
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        minWidth: 50,
                        minHeight: 0,
                      ),
                      fillColor:
                          widget.fillColor ??
                          Colors.transparent,
                      focusColor:
                          widget.focusColor ??
                          DynamicColors.textColorInverse(context),
                      contentPadding: EdgeInsets.only(
                        left: 15.w,
                        right: 15.w,
                        top: widget.tPadding ?? 10.h,
                        bottom: widget.bPadding ?? 10.h,
                      ),
                      focusedBorder: (widget.enabled == true)
                          ? UnderlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    widget.focusColor ??
                                    DynamicColors.textFieldBorderColor(context),
                              ),
                            )
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                widget.borderRadius ?? 50.r,
                              ),
                              borderSide: BorderSide(
                                color:
                                    widget.focusColor ??
                                    DynamicColors.textFieldBorderColor(context),
                              ),
                            ),
                      suffixIcon: widget.obscureText == true
                          ? IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color(0xff8F9098),
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            )
                          : widget.suffixIcon,
                      enabledBorder: (widget.enabled == true)
                          ? UnderlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    widget.enabledColor ?? Colors.transparent,
                              ),
                            )
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                widget.borderRadius ?? 50.r,
                              ),
                              borderSide: BorderSide(
                                color:
                                    widget.enabledColor ??
                                    DynamicColors.textFieldBorderColor(context),
                              ),
                            ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 50.r,
                        ),
                        borderSide: BorderSide(
                          color:
                              widget.enabledColor ??
                              DynamicColors.textFieldBorderColor(context),
                        ),
                      ),
                      border: (widget.enabled == true)
                          ? UnderlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    widget.enabledColor ??
                                    DynamicColors.textFieldBorderColor(context),
                              ),
                            )
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                widget.borderRadius ?? 50.r,
                              ),
                              borderSide: BorderSide(
                                color:
                                    widget.enabledColor ??
                                    DynamicColors.textFieldBorderColor(context),
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// كلاس يمثل الدولة
class CountryItem {
  final String code; // مثل +20
  final String flag; // مثل 🇪🇬

  CountryItem({required this.code, required this.flag});
}
