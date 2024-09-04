import 'package:flutter/material.dart';
import 'package:vylee_partner/common/common%20widgets/custom_form_field.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class RegisterTitleField extends StatelessWidget {
  const RegisterTitleField(
      {super.key,
      required this.controller,
      required this.title,
      required this.isMandatory,
      this.inputType});

  final TextEditingController controller;
  final String title;
  final TextInputType? inputType;
  final bool isMandatory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        RichText(
          text: TextSpan(
              text: title,
              style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
              children: [
                TextSpan(
                    text: isMandatory ? " *" : "",
                    style: const TextStyle(color: AppColors.red))
              ]),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomFormField(
            isEnabled: true,
            height: 60,
            keyboardType: inputType,
            width: double.infinity,
            controller: controller),
      ],
    );
  }
}
