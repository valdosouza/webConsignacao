import 'package:appweb/app/core/shared/theme.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.onChange,
    this.text,
  }) : super(key: key);

  final void Function(String) onChange;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            keyboardType: TextInputType.text,
            autofocus: true,
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
