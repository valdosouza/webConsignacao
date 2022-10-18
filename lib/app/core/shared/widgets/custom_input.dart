import 'package:appweb/app/core/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String title;
  final String? hint;
  final TextInputAction inputAction;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final String? initialValue;
  const CustomInput({
    super.key,
    required this.title,
    required this.keyboardType,
    required this.inputAction,
    required this.onChanged,
    this.initialValue = "",
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
          child: TextFormField(
            initialValue: initialValue,
            keyboardType: keyboardType,
            autofocus: true,
            textInputAction: inputAction,
            onChanged: onChanged,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
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
