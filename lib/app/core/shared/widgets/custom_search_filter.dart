import 'package:appweb/app/core/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomSearchFilter extends StatelessWidget {
  final String title;
  final bool enabled;
  final double? width;
  final int maxLines;
  final Widget? suffixIcon;
  final Function()? onAction;
  final void Function(String)? onChange;
  final String initialValue;
  final bool readOnly;

  const CustomSearchFilter({
    super.key,
    this.onAction,
    this.onChange,
    this.maxLines = 1,
    this.suffixIcon,
    this.enabled = true,
    this.width,
    required this.title,
    required this.initialValue,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      width: MediaQuery.of(context).size.width,
      height: 45,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: kBoxDecorationStyle,
              child: TextFormField(
                initialValue: initialValue,
                keyboardType: TextInputType.text,
                autofocus: false,
                onChanged: onChange,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 4.0),
                  hintText: "Pesquise/Filtre aqui",
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: (onAction != null)
                ? IconButton(
                    hoverColor: Colors.transparent,
                    onPressed: () {
                      onAction!();
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 20.0,
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
