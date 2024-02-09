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
  final double width;
  final Alignment alignment;
  final TextAlign textAlign;
  const CustomInput({
    super.key,
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
    this.controller,
    this.width = 0,
    this.alignment = Alignment.centerRight,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    double newWidth = 0;
    if (width == 0) {
      newWidth = MediaQuery.of(context).size.width;
    } else {
      newWidth = width;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: kLabelStyle),
        const SizedBox(height: 10.0),
        Container(
          height: 45,
          width: newWidth,
          alignment: alignment,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            textAlign: textAlign,
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
            style: kFieldlStyle,
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
