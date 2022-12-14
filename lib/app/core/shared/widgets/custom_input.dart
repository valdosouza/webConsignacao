import 'package:appweb/app/core/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String title;
  final String? hint;
  final TextInputAction inputAction;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? initialValue;
  final Widget? sufixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool readOnly;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  const CustomInput(
      {super.key,
      required this.title,
      required this.keyboardType,
      required this.inputAction,
      required this.onChanged,
      this.onFieldSubmitted,
      this.validator,
      this.initialValue,
      this.minLines,
      this.maxLines,
      this.sufixIcon,
      this.hint,
      this.obscureText = false,
      this.readOnly = false,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            initialValue: initialValue,
            readOnly: readOnly,
            keyboardType: keyboardType,
            autofocus: false,
            textInputAction: inputAction,
            validator: validator,
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
            obscureText: obscureText,
            controller: controller,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            minLines: minLines,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffix: sufixIcon,
              contentPadding: const EdgeInsets.only(left: 10.0),
              hintText: hint ?? "",
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
