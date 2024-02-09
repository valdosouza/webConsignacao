import 'package:appweb/app/core/shared/theme.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.onChange,
    this.text,
    this.keyboardType,
    this.controller,
  });

  final void Function(String) onChange;
  final String? text;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.text,
            autofocus: false,
            onChanged: (value) {
              onChange(value);
            },
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 10.0),
              hintText: text ?? 'Pesquisar',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
