import 'package:appweb/app/core/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String title;
  final String? hint;
  final TextInputAction inputAction;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final String? initialValue;
  final Widget? sufixIcon;
  final String? Function(String?)? validator;
  const CustomInput({
    super.key,
    required this.title,
    required this.keyboardType,
    required this.inputAction,
    required this.onChanged,
    this.validator,
    this.initialValue = "",
    this.sufixIcon,
    this.hint,
  });

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
          width: MediaQuery.of(context).size.width * 0.3,
          child: TextFormField(
            initialValue: initialValue,
            keyboardType: keyboardType,
            autofocus: true,
            textInputAction: inputAction,
            validator: validator,
            onChanged: onChanged,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
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
