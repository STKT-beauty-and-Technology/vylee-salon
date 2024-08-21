import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.isEnabled,
      this.text,
      required this.height,
      required this.width,
      required this.controller,
      this.onChanged,
      this.inputFormatters,
      this.isMultiline,
      this.keyboardType,
      this.label,
      this.prefixText,
      this.prefixTextStyle,
      this.hintTextStyle,
      this.borderSide});
  final bool isEnabled;
  final TextEditingController controller;
  final String? text;
  final double width;
  final double height;
  final double borderRadius = 10;
  final double contentPadding = 10;
  final Function? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isMultiline;
  final TextInputType? keyboardType;
  final String? label;
  final String? prefixText;
  final TextStyle? prefixTextStyle;
  final TextStyle? hintTextStyle;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        autocorrect: true,
        controller: controller,
        textAlign: TextAlign.start,
        textInputAction: isMultiline == true ? null : TextInputAction.next,
        inputFormatters: inputFormatters,
        maxLines: isMultiline == true ? 4 : 1,
        keyboardType: keyboardType,
        onChanged: onChanged != null
            ? (text) async {
                await onChanged!();
              }
            : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide:
                borderSide ?? const BorderSide(color: AppColors.appViolet),
          ),
          prefixText: prefixText,
          prefixStyle: prefixTextStyle ?? hintTextStyle,
          hintText: text != null
              ? text?.toLowerCase() == "otp" && !isEnabled
                  ? "Enter number above to get otp"
                  : text
              : null,
          hintStyle: hintTextStyle,
          labelStyle: isEnabled ? null : const TextStyle(color: Colors.white),
          label: label != null
              ? Align(
                  alignment: Alignment.center,
                  child: Text(
                    label!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppColors.gray600),
                  ),
                )
              : null,
          alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          enabled: isEnabled,
          contentPadding: EdgeInsets.all(contentPadding),
          fillColor: isEnabled ? AppColors.white : AppColors.gray600,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide:
                 borderSide ??
                const BorderSide(color: AppColors.appViolet, width: 2.5),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
        ),
      ),
    );
  }
}
